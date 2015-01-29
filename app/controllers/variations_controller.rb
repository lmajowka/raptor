class VariationsController < InheritedResources::Base
  before_action :authenticate
  before_action :reorganize, only: :update
  before_action :get_population_logic, only: [:create,:update]

  def permitted_params
    params.permit(:variation => [:title, :population_logic, :experiment_id])
  end

  def create
    create!{redirect_to @variation.experiment and return}
  end

  private

  def get_population_logic
    return unless params[:variation][:population_logic] and params[:variation][:experiment_id]
    return params[:variation][:population_logic] = "100-100" if params[:variation][:population_logic] == "0"
    ranges = Variation.get_ranges_for(params[:variation][:experiment_id],params[:id])
    first_range = max_range(ranges) + 1
    params[:variation][:population_logic] = "#{first_range}-#{first_range+params[:variation][:population_logic].to_i - 1}"
  end

  def max_range(ranges)
    (ranges.map(&:to_a).flatten - ["100"]).map(&:to_i).max || -1
  end

  def reorganize
    current_range = 0
    other_variations = Variation.where(experiment_id: params[:variation][:experiment_id]).where('id <> ?',params[:id]).not_zero.all
    other_variations.each do |variation|
      ranges = variation.population_logic.split("-")
      range_size = ranges[1].to_i - ranges[0].to_i
      variation.update(population_logic: "#{current_range}-#{current_range+range_size}")
      variation.save(validate: false)
      current_range = current_range + range_size + 1
    end
  end

end
