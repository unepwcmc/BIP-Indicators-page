class BIPIndicatorsPage.Models.Goal extends Backbone.Model
  paramRoot: 'goal'

  defaults:
    code: null
    title: null

class BIPIndicatorsPage.Collections.GoalsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Goal
  url: '/goals'
