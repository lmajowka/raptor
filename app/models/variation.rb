class Variation < ActiveRecord::Base
  belongs_to :experiment
  has_many :changes

  validate :valid_population_logic
  validates_presence_of :experiment, :title

  scope :not_zero, ->{where("population_logic != '100-100'")}

  def valid_population_logic

    return if population_logic == "100-100"

    ranges = Variation.get_ranges_for(experiment_id,id)

    populations = population_logic.split ","
    populations.each do |population|
      range = population.split "-"
      errors.add(:population_logic, "invalid range") unless range.size == 2
      errors.add(:population_logic, "Population test exceeds 100%") unless range[1].to_i < 100
      range.each do |r|
        errors.add(:population_logic, "invalid number") unless r.try(:to_i)
      end
      r = Range.new(range[0],range[1])
      ranges.each do |range|
        errors.add(:population_logic, "population already in use") unless (r.to_a & range.to_a).empty?
      end
    end
  end

  def self.get_ranges_for(experiment_id,id)
    ranges = []

    other_variations = Variation.where(experiment_id: experiment_id).not_zero
    other_variations = other_variations.where('id <> ?',id) if id
    other_variations.each do |variation|
      populations = variation.population_logic.split ","
      populations.each do |population|
        range = population.split "-"
        ranges << Range.new(range[0],range[1])
      end
    end

    ranges

  end

  def self.get_percentual(population_logic)
    return 0 unless population_logic
    return 0 if population_logic == "100-100"
    ranges = population_logic.split("-")
    "#{ranges[1].to_i - ranges[0].to_i + 1}"
  end

end
