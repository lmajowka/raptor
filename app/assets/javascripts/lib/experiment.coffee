class Raptor.Lib.Experiment
  @oldValue = 0

  @publishForever: (checkbox) ->
    if checkbox.checked
      @oldValue = $('#experiment_published_until_1i').val()
      $('#experiment_published_until_1i').val("2050")
    else
      $('#experiment_published_until_1i').val(@oldValue)