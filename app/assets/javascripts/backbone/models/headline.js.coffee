class BIPIndicatorsPage.Models.Headline extends Backbone.Model
  paramRoot: 'headline'

  defaults:
    title: null
    position: null

class BIPIndicatorsPage.Collections.HeadlinesCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Headline
  url: '/headlines'
