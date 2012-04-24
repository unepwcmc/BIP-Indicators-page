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

  belongsToTarget: (targetId) ->
    _.pluck(@get('targets'), 'id').indexOf(targetId) != -1

  belongsToHeadline: (headlineId) ->
    @get('headline_id') == headlineId

  belongsToFocalArea: (focalAreaId) ->
    _.pluck(@get('focal_areas'), 'id').indexOf(focalAreaId) != -1

  belongsToPartner: (partnerId) ->
    _.pluck(@get('partners'), 'id').indexOf(partnerId) != -1

class BIPIndicatorsPage.Collections.IndicatorsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Indicator
  url: '/indicators'

  filters:
    headline: null
    focalArea: null
    goal: null
    target: null
    partner: null

  resetTabFilters: ->
    @filters.headline = null
    @filters.focalArea = null
    @filters.goal = null
    @filters.target = null

  resetFilters: ->
    @resetTabFilters()
    @filters.partner = null

  getCountPerTarget: (target) ->
    res = 0
    _.each @models, (indicator) =>
     # if it belongs to this target and and matches the current partner selection
     if indicator.belongsToTarget(target.id) && (!@filters.partner? || indicator.belongsToPartner(@filters.partner.get('id')))
       res += 1
    return res

  getCountPerHeadline: (headline) ->
    res = 0
    _.each @models, (indicator) =>
     # if it belongs to this target and and matches the current partner selection
     if indicator.belongsToHeadline(headline.id) && (!@filters.partner? || indicator.belongsToPartner(@filters.partner.get('id')))
       res += 1
    return res

  getCountPerFocalArea: (focalArea) ->
    res = 0
    _.each @models, (indicator) =>
     # if it belongs to this focal area and and matches the current partner selection
     if indicator.belongsToFocalArea(focalArea.id) && (!@filters.partner? || indicator.belongsToPartner(@filters.partner.get('id')))
       res += 1
    return res

  applyFilter: ->
    _.each @models, (indicator) =>
      indicator.set
        'show': (
          (
            @filters.headline? && indicator.belongsToHeadline(@filters.headline.get('id')) ||
            @filters.focalArea? && indicator.belongsToFocalArea(@filters.focalArea.get('id')) ||
            @filters.target? && indicator.belongsToTarget(@filters.target.get('id'))
          ) && (!@filters.partner? || indicator.belongsToPartner(@filters.partner.get('id')))
        )

  filterByHeadline: (headline) ->
    @resetTabFilters()
    @filters.headline = headline
    @applyFilter()

  filterByFocalArea: (focalArea) ->
    @resetTabFilters()
    @filters.focalArea = focalArea
    @applyFilter()

  filterByGoal: (goal) ->
    _.each @models, (indicator) ->
      indicator.set({'show': (_.intersection(_.pluck(indicator.get('targets'), 'id'), _.pluck(goal.get('targets'), 'id')).length > 0 ) })

  filterByTarget: (target) ->
    @resetTabFilters()
    @filters.target = target
    @applyFilter()

  filterByPartner: (partner) ->
    @filters.partner = partner
    @updateIndicatorCounts()
    @applyFilter()

  updateIndicatorCounts: ->
    targets = new BIPIndicatorsPage.Collections.TargetsCollection()
    targets.fetch()
    targets.each (item) =>
      item.applyIndicatorCnt(@getCountPerTarget(item))
    headlines = new BIPIndicatorsPage.Collections.HeadlinesCollection()
    headlines.fetch()
    headlines.each (item) =>
      item.applyIndicatorCnt(@getCountPerHeadline(item))
    focalAreas = new BIPIndicatorsPage.Collections.FocalAreasCollection()
    focalAreas.fetch()
    focalAreas.each (item) =>
      item.applyIndicatorCnt(@getCountPerFocalArea(item))
