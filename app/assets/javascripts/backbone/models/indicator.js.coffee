class BIPIndicatorsPage.Models.Indicator extends Backbone.Model
  paramRoot: 'indicator'

  defaults:
    headline_id: null
    title: null
    position: null
    targets: []
    link: ''
    # extra fields for interface
    show: false

class BIPIndicatorsPage.Collections.IndicatorsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Indicator
  url: '/indicators'

  filterByHeadline: (headline) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (indicator.get('headline_id') == headline.get('id') )})

  filterByGoal: (goal) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (_.intersection(_.pluck(indicator.get('targets'), 'id'), _.pluck(goal.get('targets'), 'id')).length > 0 ) })

  filterByTarget: (target) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (_.pluck(indicator.get('targets'), 'id').indexOf(target.get('id')) != -1 ) })
