BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.IndexView extends Backbone.View
  template: JST["backbone/templates/indicators/index"]

  events:
    'click .reset-filters' : 'resetFilters'

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
    indicatorCnt = @options.indicators.filter((ele) -> (ele.get('show') ? 1 : 0)).length
    counterEl = $(@el).find('#indicators-count')
    counterEl.addClass("indicator-cnt-#{@options.indicators.indicatorCntClassIdx(indicatorCnt)}")
    counterValEl = $(counterEl).find('span')
    counterValEl.text(indicatorCnt)
    countLegendEl = $(@el).find('#indicators-count-legend')
    legend = @options.indicators.indicatorCntClassLegend()
    for classIdx, classProperties of legend
      div = "<div class='indicator-cnt-#{classIdx}'>#{classProperties['label']}</div>"
      countLegendEl.append(div)
    @addAll()
    if socket
      socket.postMessage(document.body.scrollHeight)

    return this

  resetFilters: (e) ->
    e.preventDefault()

    @options.indicators.resetFilters()
    @options.indicators.applyFilter()
    router.resetFilters()
