class BIPIndicatorsPage.Models.Headline extends Backbone.Model
  paramRoot: 'headline'

  defaults:
    code: null
    title: null
    position: null
    # extra fields for interface
    selected: false

  select: ->
    @collection.deselectAll()
    @save({'selected': true})
    # Filter indicators by headline
    router.filterByHeadline(@)

  deselect: ->
    @save({'selected': false})

class BIPIndicatorsPage.Collections.HeadlinesCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Headline
  localStorage: new Store("bip_headlines")

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()

  selected: ->
    @filter (headline) ->
      headline.get('selected')
