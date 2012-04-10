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

  filterByHeadline: (headline) ->
    @indicators.filterByHeadline(headline)

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

    @indicators.filterByGoal(goal)

  filterByTarget: (target) ->
    @indicators.filterByTarget(target)
