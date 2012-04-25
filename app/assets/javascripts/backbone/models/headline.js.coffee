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

  applyIndicatorCnt: (stats) ->
    @save({'indicatorCnt': stats['cnt'], 'indicatorCntClass': stats['cntClass']})

class BIPIndicatorsPage.Collections.HeadlinesCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Headline
  localStorage: new Store("bip_headlines")

  saveAll: ->
    _.each @models, (target) ->
      target.save()

  deselectAll: ->
    _.each @models, (headline) ->
      headline.deselect()

  selected: ->
    @filter (headline) ->
      headline.get('selected')
