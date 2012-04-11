class BIPIndicatorsPage.Models.Headline extends Backbone.Model
  paramRoot: 'headline'

  defaults:
    title: null
    position: null
    # extra fields for interface
    selected: false

  select: ->
    @collection.deselectAll()
    @set({'selected': true})

    # Filter indicators by headline
    router.filterByHeadline(@)

  deselect: ->
    @set({'selected': false})

class BIPIndicatorsPage.Collections.HeadlinesCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Headline
  url: '/headlines'

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()

  selected: ->
    @filter (headline) ->
      headline.get('selected')
