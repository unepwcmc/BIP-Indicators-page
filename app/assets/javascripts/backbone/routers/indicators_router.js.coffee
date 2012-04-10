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
