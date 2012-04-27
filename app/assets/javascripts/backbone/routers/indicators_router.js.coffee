class BIPIndicatorsPage.Routers.IndicatorsRouter extends Backbone.Router
  initialize: (options) ->
    @ftsData = []

    previousTimestamp = amplify.store('bip_timestamp')
    amplify.store('bip_timestamp', options.timestamp) if (previousTimestamp != options.timestamp)

    # Indicators
    @indicators = new BIPIndicatorsPage.Collections.IndicatorsCollection()
    @indicators.reset options.indicators

    @indicators.each (item) =>
      @ftsData.push({id: item.id, label: item.attributes.title, category: 'indicator', link: item.attributes.link})

    # Targets
    @targets = new BIPIndicatorsPage.Collections.TargetsCollection()
    @targets.fetch()
    if (previousTimestamp != options.timestamp)
      @targets.each (target) ->
        target.destroy()
      @targets.reset options.targets
      @targets.saveAll()

    @targets.each (item) =>
      @ftsData.push({id: item.id, label: item.attributes.title, category: 'target'})

    # Goals
    @goals = new BIPIndicatorsPage.Collections.GoalsCollection()
    @goals.reset options.goals

    @goals.each (item) =>
      @ftsData.push({id: item.id, label: item.attributes.title, category: 'goal'})

    # Headlines
    @headlines = new BIPIndicatorsPage.Collections.HeadlinesCollection()
    @headlines.fetch()
    if (previousTimestamp != options.timestamp)
      @headlines.each (headline) ->
        headline.destroy()
      @headlines.reset options.headlines
      @headlines.saveAll()

    @headlines.each (item) =>
      @ftsData.push({id: item.id, label: item.attributes.title, category: 'headline'})

    # Focal areas
    @focal_areas = new BIPIndicatorsPage.Collections.FocalAreasCollection()
    @focal_areas.fetch()
    if (previousTimestamp != options.timestamp)
      @focal_areas.each (focal_area) ->
        focal_area.destroy()
      @focal_areas.reset options.focal_areas
      @focal_areas.saveAll()

    @focal_areas.each (item) =>
      @ftsData.push({id: item.id, label: item.attributes.name + ' ' + item.attributes.question, category: 'framework'})

    # Partners
    @partners = new BIPIndicatorsPage.Collections.PartnersCollection()
    @partners.fetch()
    if (previousTimestamp != options.timestamp)
      @partners.each (partner) ->
        partner.destroy()
      @partners.reset options.partners
      @partners.saveAll()

    @resetIndicatorCounts()
    @fts_data = JSON.parse(options.fts_data)

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

    # Focal areas
    @focalAreasView = new BIPIndicatorsPage.Views.FocalAreas.IndexView(focalAreas: @focal_areas)
    $("#graphic").html(@focalAreasView.render().el)

    # Partners
    @partnersView = new BIPIndicatorsPage.Views.Partners.IndexView(partners: @partners)
    $("#partners").append(@partnersView.render().el)

    # Full text search
    @searchView = new BIPIndicatorsPage.Views.SearchView(ftsData: @ftsData)
    $("#search").append(@searchView.render().el)

    # Click event on tabs
    $('a[data-toggle="tab"]').on('shown', @switchContext)

    # Select previously active tab
    @activateTab(amplify.store('bip_active_tab'))

    $('#toggles').tooltip({title: 'These filters will be implemented in later iterations of the tool.'})

  activateByCategory: (category, itemId) =>
    if category == 'goal'
      @activateGoal(itemId)
    else if category == 'target'
      @activateTarget(itemId)
    else if category == 'headline'
      @activateHeadline(itemId)
    else
      @activateFocalArea(itemId)

  activateGoal: (goalId = null) =>
    @activateTab('#matrix')

  activateTarget: (targetId) =>
    @activateTab('#matrix')
    _.each @goals.models, (goal) ->
      t = goal.targets.find((t) -> t.id == targetId)
      if t
        t.select()
        return

  activateHeadline: (headlineId) =>
    @activateTab('#headlines')
    h = @headlines.find((h) -> h.id == headlineId)
    h.select()

  activateFocalArea: (focalAreaId) =>
    @activateTab('#graphic')
    f = @focal_areas.find((f) -> f.id == focalAreaId)
    f.select()

  activateTab: (tabStr = '#matrix') =>
    @switchContext(tabStr)
    $("a[href='#{tabStr}']").click()

  switchContext: (e) =>
    tabStr = e
    if typeof e != 'string'
      tabStr = $(e.target).attr('href')
    amplify.store('bip_active_tab', tabStr)
    if(tabStr == '#matrix')
      # by default if deselect all the indicators
      @indicators.filterByTarget()
      _.each @goals.models, (goal) =>
        if goal.targets.selected().length == 1
          @indicators.filterByTarget(goal.targets.selected()[0])
    else if(tabStr == '#graphic')
      @filterByFocalArea(@focal_areas.selected()[0])
    else
      @filterByHeadline(@headlines.selected()[0])
    @filterByPartner(@partners.selected()[0])

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

  filterByPartner: (partner) ->
    @indicators.filterByPartner(partner)
    @resetIndicatorCounts()

  resetIndicatorCounts: ->
    @indicators.updateIndicatorCounts({
      goals: @goals,
      headlines: @headlines,
      focalAreas: @focal_areas
    })

  resetFilters: ->
    @goals.deselectAllTargets()
    @headlines.deselectAll()
    @focal_areas.deselectAll()
    @partners.deselectAll()
    @resetIndicatorCounts()
