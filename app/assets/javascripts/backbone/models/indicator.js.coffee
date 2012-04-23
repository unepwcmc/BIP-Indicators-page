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
            @filters.headline? && indicator.get('headline_id') == @filters.headline.get('id') ||
            @filters.focalArea? && _.pluck(indicator.get('focal_areas'), 'id').indexOf(@filters.focalArea.get('id')) != -1 ||
            @filters.target? && _.pluck(indicator.get('targets'), 'id').indexOf(@filters.target.get('id')) != -1
          ) &&
          (!@filters.partner? || _.pluck(indicator.get('partners'), 'id').indexOf(@filters.partner.get('id')) != -1)
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
