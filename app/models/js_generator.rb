class JSGenerator

  def self.generate
    experiments = Experiment.visible
    Jbuilder.new do |json|
      json.array! experiments do |experiment|
        json.published_until experiment.published_until.to_i * 1000
        json.status experiment.status
        json.country_code experiment.country_code
        json.url experiment.url
        json.variations experiment.variations do |variation|
          json.population_logic variation.population_logic
          json.changes variation.changes do |change|
            json.selector change.selector
            json.content change.content
            json.css_text change.css_text
          end
          #json.rules variation.rules.map(&:js_condition)
        end
      end
    end.target!
  end

end