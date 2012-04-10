class BIPIndicatorsPage.Models.Goal extends Backbone.Model
  paramRoot: 'goal'

  defaults:
    code: null
    title: null
    targets: []

  initialize: ->
    @targets = new BIPIndicatorsPage.Collections.TargetsCollection()
    @targets.reset @get('targets')

    # Deselect all targets from all goals when selecting a target
    @targets.on 'unique:select:target', @deselectAllTargets

  deselectAllTargets: =>
    _.each @collection.models, (goal) ->
      goal.targets.deselectAll()

class BIPIndicatorsPage.Collections.GoalsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Goal
  url: '/goals'
