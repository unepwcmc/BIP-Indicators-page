class BIPIndicatorsPage.Models.Target extends Backbone.Model
  paramRoot: 'target'

  defaults:
    goal_id: null
    index: null
    keyword: null
    title: null

class BIPIndicatorsPage.Collections.TargetsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Target
  url: '/targets'
