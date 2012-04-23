class BIPIndicatorsPage.Models.Headline extends Backbone.Model
  paramRoot: 'headline'

  defaults:
    code: null
    title: null
    position: null
    # extra fields for interface
    selected: false
    indicatorCnt: 0
    indicatorCntClass: 0

  select: ->
    @collection.deselectAll()
    @save({'selected': true})
    # Filter indicators by headline
    router.filterByHeadline(@)

  deselect: ->
    @save({'selected': false})

  applyIndicatorCnt: (cnt) ->
    @save({'indicatorCnt': cnt})
    @save({'indicatorCntClass': window.BIPIndicatorsPage.indicatorCntClassIdx(@get('indicatorCnt'))})

class BIPIndicatorsPage.Collections.HeadlinesCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Headline
  localStorage: new Store("bip_headlines")

  applyIndicatorCntAll: ->
    _.each @models, (headline) ->
      headline.applyIndicatorCnt(Math.floor(Math.random()*29))

  deselectAll: ->
    _.each @models, (headline) ->
      headline.deselect()

  selected: ->
    @filter (headline) ->
      headline.get('selected')
