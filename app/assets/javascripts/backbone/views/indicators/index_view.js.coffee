BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.IndexView extends Backbone.View
  template: JST["backbone/templates/indicators/index"]

  initialize: () ->
    @options.indicators.bind('reset', @addAll)
    @options.indicators.bind('change', @render)

  addAll: () =>
    @options.indicators.each(@addOne)

  addOne: (indicator) =>
    view = new BIPIndicatorsPage.Views.Indicators.IndicatorView({model : indicator})
    @$("#indicators-container").append(view.render().el)

  render: =>
    $(@el).html(@template(indicators: @options.indicators.toJSON() ))
    @addAll()
    if socket
      socket.postMessage(document.body.scrollHeight)

    return this
