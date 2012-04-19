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
    indicatorMinCnt: 0
    indicatorMaxCnt: 29
    indicatorClassCnt: 4
  }
  indicatorCntClassIdx: (indicatorCnt) ->
    @cntClassIdx(indicatorCnt, @defaults.indicatorMinCnt, @defaults.indicatorMaxCnt, @defaults.indicatorClassCnt)

  cntClassIdx: (itemCnt, itemMinCnt, itemMaxCnt, classCnt) ->
    span = itemMaxCnt - itemMinCnt
    classOffset = Math.floor((span - span % classCnt) / classCnt) + 1
    classIdx = 0
    while (itemMinCnt + (classIdx + 1) * classOffset) < itemCnt
      classIdx += 1
    return classIdx
