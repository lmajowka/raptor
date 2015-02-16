class Raptor.Pages.Experiment
  @currentVariationId = 0

  @initialize: ->
    @updateChangesPanel()
    @updateVariationTabs()

  @selectVariation: (variationId, percent) ->
    @currentVariationId = variationId
    @updateChangesPanel()
    @updateVariationTabs()
    @updateIframe(percent)

  @updateChangesPanel: ->
    $('#new-change')[0].href = $('#new-change')[0].href.replace(/\=[0-9]+/,"=#{@currentVariationId}")
    $('.change-of-variation').hide()
    $(".change-of-variation-#{@currentVariationId}").show()

  @updateVariationTabs: ->
    $('.tab-variation').removeClass('selected-variation')
    $("#tab-variation-#{@currentVariationId}").addClass('selected-variation')

  @checkJSPresence: ->
    if not raptorLoaded
      alert "Javascript js.js not found"

  @updateIframe: (percent) ->
    $('iframe')[0].src = @iframeURL percent

  @iframeURL: (percent) ->
    $('iframe')[0].src.replace(/\=([0-9]+)/g,"=#{(percent - 1)}")