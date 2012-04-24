class BIPIndicatorsPage.Models.Goal extends Backbone.Model
  paramRoot: 'goal'

  defaults:
    code: null
    title: null

  initialize: ->
    @targets = new BIPIndicatorsPage.Collections.TargetsCollection()
    @targets.fetch()
    @targets.on 'unique:select:target', @collection.deselectAllTargets
    that = @
    @filteredTargets = @targets.filter (target) ->
      target.attributes.goal_id == that.id
    @targets.reset(@filteredTargets)

class BIPIndicatorsPage.Collections.GoalsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Goal
  localStorage: new Store("bip_goals")

  deselectAllTargets: =>
    _.each @models, (goal) ->
      goal.targets.deselectAll()
