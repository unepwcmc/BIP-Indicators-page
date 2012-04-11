class BIPIndicatorsPage.Models.Target extends Backbone.Model
  paramRoot: 'target'

  defaults:
    goal_id: null
    index: null
    keyword: null
    title: null
    # extra fields for interface
    selected: false

  select: ->
    @trigger('unique:select:target')
    @set({'selected': true})
    router.filterByTarget(@)

  deselect: ->
    @set({'selected': false})

class BIPIndicatorsPage.Collections.TargetsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Target
  url: '/targets'

  selectAll: ->
    _.each @models, (target) ->
      target.set({'selected': true})

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()
