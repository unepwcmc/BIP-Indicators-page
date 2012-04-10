class BIPIndicatorsPage.Models.Goal extends Backbone.Model
  paramRoot: 'goal'

  defaults:
    code: null
    title: null
    targets: []

  initialize: ->
    @targets = new BIPIndicatorsPage.Collections.TargetsCollection()
    @targets.reset @get('targets')

class BIPIndicatorsPage.Collections.GoalsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Goal
  url: '/goals'
