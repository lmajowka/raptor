class ChangesController < InheritedResources::Base

  before_action :authenticate

  def permitted_params
    params.permit(:change => [:content, :selector, :css_text, :variation_id])
  end

  def create
    create!{back_to_experiment and return}
  end

  private

  def back_to_experiment
    redirect_to @change.variation.experiment
  end

end