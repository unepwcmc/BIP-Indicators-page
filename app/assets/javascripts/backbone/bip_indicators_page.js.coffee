#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BIPIndicatorsPage =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  #to facilitate color coding indicator density
  defaults: {
    indicatorClasses: {
      0: [0, 0]
      1: [1, 2]
      2: [3, 8]
      3: [9, 29]
    }
  }
  indicatorCntClassIdx: (indicatorCnt) ->
    for classIdx, classRange of @defaults.indicatorClasses
      if indicatorCnt >= classRange[0] && indicatorCnt <= classRange[1]
        break
    return classIdx

  indicatorCntClassLegend: ->
    legend = {}
    totalElements = 30
    for classIdx, classRange of @defaults.indicatorClasses
      elCnt = 1 + classRange[1] - classRange[0]
      legend[classIdx] = {
        percent: Math.round((elCnt / totalElements) * 100),
        label: classRange[1]
      }
    return legend
