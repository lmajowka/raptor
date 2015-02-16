class Raptor.Lib.Runner

  constructor: (data) ->

    @data = data
    @timer = {}

    try
      @version = Raptor.Lib.Test.version() % 100
    catch error
      @version = 55

  run: ->
    $.each @activeExperiments(), (key, experiment) =>
      $.each @relevantVariationsForPopulation(experiment) , (key,variation) =>
        $.each variation.changes, (key,change) =>
          @timer[change.selector] = setInterval @applyChange change, 200
    setTimeout ( => @timeOut() ) , 12000


  timeOut: =>
    for selector of @timer
      clearInterval(@timer[selector])

  applyChange: (change) =>
    =>
      try
        if not change.applied
          $(change.selector)[0].innerHTML = $(change.selector)[0].innerHTML #Check if element is already there
          if change.content
            $.each $(change.selector),( (key,obj) -> obj.innerHTML = change.content )
          if change.css_text
            $.each $(change.selector), ( (key,obj) -> obj.style.cssText = change.css_text )
          clearInterval(@timer[change.selector])
          change.applied = true
      catch error

  activeExperiments: ->
    @data.filter (experiment) =>
      parseInt(experiment.published_until) >= new Date().getTime() and
      ( experiment.status == "published" or
        ( @seeDrafts experiment ) ) and
      experiment.url.match location.pathname

  seeDrafts: (experiment) ->
    experiment.status == "draft" && location.search.match /seedrafts/

  relevantVariationsForPopulation: (experiment) ->
    experiment.variations.filter (variation) =>
      @parsePopulationLogic(variation.population_logic)

  parsePopulationLogic: (population_logic) ->
    populations = population_logic.split(",")
    for population in populations
      range = population.split("-")
      return true if parseInt(range[0]) <= @version <= parseInt(range[1])
    false

