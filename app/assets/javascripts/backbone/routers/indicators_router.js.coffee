class BIPIndicatorsPage.Routers.IndicatorsRouter extends Backbone.Router
  initialize: (options) ->
    @indicators = new BIPIndicatorsPage.Collections.IndicatorsCollection()
    @indicators.reset options.indicators

    # Goals
    @goals = new BIPIndicatorsPage.Collections.GoalsCollection()
    @goals.reset options.goals

    # Headlines
    @headlines = new BIPIndicatorsPage.Collections.HeadlinesCollection()
    @headlines.reset options.headlines

    # Focal areas
    @focal_areas = new BIPIndicatorsPage.Collections.FocalAreasCollection()
    @focal_areas.reset options.focal_areas

    # Partners
    @partners = new BIPIndicatorsPage.Collections.PartnersCollection()
    @partners.reset options.partners

  routes:
    ".*"        : "index"

  index: ->
    @indicatorsView = new BIPIndicatorsPage.Views.Indicators.IndexView(indicators: @indicators)
    $("#indicators").html(@indicatorsView.render().el)

    # Goals
    @goalsView = new BIPIndicatorsPage.Views.Goals.IndexView(goals: @goals)
    $("#goals").html(@goalsView.render().el)

    # Headlines
    @headlinesView = new BIPIndicatorsPage.Views.Headlines.IndexView(headlines: @headlines)
    $("#headlines").html(@headlinesView.render().el)

    # Partners
    @partnersView = new BIPIndicatorsPage.Views.Partners.IndexView(partners: @partners)
    $("#partners").append(@partnersView.render().el)

    # Click event on tabs
    $('a[data-toggle="tab"]').on('shown', @switchContext)

  switchContext: (e) =>
    if($(e.target).attr('href') == '#matrix')
      # by default if deselect all the indicators
      @indicators.filterByTarget()

      _.each @goals.models, (goal) =>
        if goal.targets.selected().length == 1
          @indicators.filterByTarget(goal.targets.selected()[0])
    else if($(e.target).attr('href') == '#graphic')
      @filterByFocalArea(@focal_areas.selected()[0])
    else
      @filterByHeadline(@headlines.selected()[0])

  filterByHeadline: (headline) ->
    @indicators.filterByHeadline(headline)

  filterByFocalArea: (focalArea) ->
    if typeof(focalArea) == 'string'
      found_focal_areas = _.filter(@focal_areas.models, (iter_focal_area) ->
        iter_focal_area.get('name') == focalArea
      )
      if found_focal_areas.length == 1
        focalArea = found_focal_areas[0]
      else
        console.log("Error: #{found_focal_areas.length} focal areas found. Should have found an unique focal area for the given name.")
        return false

    # Force selection on model, as there is no view for the focal area
    focalArea.select() if focalArea?

    @indicators.filterByFocalArea(focalArea)

  filterByGoal: (goal) ->
    if typeof(goal) == 'string'
      found_goals = _.filter(@goals.models, (iter_goal) ->
        iter_goal.get('code') == goal
      )
      if found_goals.length == 1
        goal = found_goals[0]
      else
        console.log("Error: #{found_goals.length} goals found. Should have found an unique goal for the given code.")
        return false

    # Reset target selection and select all from the given goal
    goal.deselectAllTargets()
    goal.selectAllTargetsFromCurrentGoal()

    @indicators.filterByGoal(goal)

  filterByTarget: (target) ->
    @indicators.filterByTarget(target)

  filterByPartner: (partnerId) ->
    partner = @partners.get(partnerId)
    @indicators.filterByPartner(partner)
