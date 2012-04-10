class BIPIndicatorsPage.Models.Indicator extends Backbone.Model
  paramRoot: 'indicator'

  defaults:
    headline_id: null
    partner_id: null
    title: null
    position: null

class BIPIndicatorsPage.Collections.IndicatorsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Indicator
  url: '/indicators'
