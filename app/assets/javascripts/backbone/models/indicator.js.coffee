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
    @applyFilter()

  getStatsPerObject: (obj) ->
    res = 0
    _.each @models, (indicator) =>
      cond = false
      if obj instanceof BIPIndicatorsPage.Models.Target
        cond = indicator.belongsToTarget(obj.id)
      else if obj instanceof BIPIndicatorsPage.Models.Headline
        cond = indicator.belongsToHeadline(obj.id)
      else
        cond = indicator.belongsToFocalArea(obj.id)
      # if it belongs to this object and and matches the current partner selection
      if cond && (!@filters.partner? || indicator.belongsToPartner(@filters.partner.get('id')))
        res += 1
    return {
      cnt : res,
      cntClass : @indicatorCntClassIdx(res)
    }

  updateIndicatorCounts: (objects) ->
    objects['goals'].each (goal) =>
      goal.targets.each (item) =>
        item.applyIndicatorCnt(@getStatsPerObject(item))
    objects['headlines'].each (item) =>
      item.applyIndicatorCnt(@getStatsPerObject(item))
    objects['focalAreas'].each (item) =>
      item.applyIndicatorCnt(@getStatsPerObject(item))

  #to facilitate color coding indicator density
  defaults: {
    indicatorClasses: {
      0: [0, 0]
      1: [1, 2]
      2: [3, 8]
      3: [9, 29]
    }
  }

  indicatorCntClassIdx: (indicatorCnt) ->
    for classIdx, classRange of @defaults.indicatorClasses
      if indicatorCnt >= classRange[0] && indicatorCnt <= classRange[1]
        break
    return classIdx

  indicatorCntClassLegend: ->
    legend = {}
    totalElements = 30
    for classIdx, classRange of @defaults.indicatorClasses
      elCnt = 1 + classRange[1] - classRange[0]
      legend[classIdx] = {
        percent: Math.round((elCnt / totalElements) * 100),
        label: classRange[1]
      }
    return legend