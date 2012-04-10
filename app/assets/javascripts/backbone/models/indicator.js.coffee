class BIPIndicatorsPage.Models.Indicator extends Backbone.Model
  paramRoot: 'indicator'

  defaults:
    headline_id: null
    title: null
    position: null
    targets: []
    # extra fields for interface
    show: false

class BIPIndicatorsPage.Collections.IndicatorsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Indicator
  url: '/indicators'

  filterByHeadline: (headline) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (indicator.get('headline_id') == headline.get('id') )})

  filterByGoal: (goal) ->
