class BIPIndicatorsPage.Models.Target extends Backbone.Model
  paramRoot: 'target'

  defaults:
    goal_id: null
    code: null
    keyword: null
    title: null
    # extra fields for interface
    selected: false

  select: ->
    @trigger('unique:select:target')
    @save({'selected': true})
    router.filterByTarget(@)

  deselect: ->
    @save({'selected': false})

class BIPIndicatorsPage.Collections.TargetsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Target
  localStorage: new Store("bip_targets")

  saveAll: ->
    _.each @models, (target) ->
      target.save()

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()

  selected: ->
    @filter (target) ->
      target.get('selected')
