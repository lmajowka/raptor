class Raptor.Pages.Experiment
  @currentVariationId = 0

  @initialize: ->
    @updateChangesPanel()
    @updateVariationTabs()

  @selectVariation: (variationId) ->
    @currentVariationId = variationId
    @updateChangesPanel()
    @updateVariationTabs()


  @updateChangesPanel: ->
    $('#new-change')[0].href = $('#new-change')[0].href.replace(/\=[0-9]+/,"=#{@currentVariationId}")
    $('.change-of-variation').hide()
    $(".change-of-variation-#{@currentVariationId}").show()

  @updateVariationTabs: ->
    $('.tab-variation').removeClass('selected-variation')
    $("#tab-variation-#{@currentVariationId}").addClass('selected-variation')

