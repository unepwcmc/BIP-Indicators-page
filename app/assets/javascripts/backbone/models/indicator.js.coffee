class BIPIndicatorsPage.Models.Indicator extends Backbone.Model
  paramRoot: 'indicator'

  defaults:
    headline_id: null
    title: null
    position: null
    rel_link: null
    link: null
    targets: []
    focal_areas: []
    partners: []
    # extra fields for interface
    show: false

class BIPIndicatorsPage.Collections.IndicatorsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Indicator
  url: '/indicators'

  filters:
    headline: null
    focalArea: null
    goal: null
    target: null
    partner: null

  filterByHeadline: (headline) ->
    if headline?
      _.each @models, (indicator) ->
        indicator.set({'show': (indicator.get('headline_id') == headline.get('id') )})
    else
      _.each @models, (indicator) ->
        indicator.set({'show': false })

  filterByFocalArea: (focalArea) ->
    if focalArea?
      _.each @models, (indicator) ->
        indicator.set({'show': (_.pluck(indicator.get('focal_areas'), 'id').indexOf(focalArea.get('id')) != -1 ) })
    else
      _.each @models, (indicator) ->
        indicator.set({'show': false })

  filterByGoal: (goal) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (_.intersection(_.pluck(indicator.get('targets'), 'id'), _.pluck(goal.get('targets'), 'id')).length > 0 ) })

  filterByTarget: (target) ->
    if target?
      _.each @models, (indicator) ->
        indicator.set({'show': (_.pluck(indicator.get('targets'), 'id').indexOf(target.get('id')) != -1 ) })
    else
      _.each @models, (indicator) ->
        indicator.set({'show': false })

  filterByPartner: (partner) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (_.pluck(indicator.get('partners'), 'id').indexOf(partner.get('id')) != -1 ) })
