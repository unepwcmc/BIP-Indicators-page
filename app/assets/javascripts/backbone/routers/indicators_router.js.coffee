class BIPIndicatorsPage.Routers.IndicatorsRouter extends Backbone.Router
  initialize: (options) ->
    @indicators = new BIPIndicatorsPage.Collections.IndicatorsCollection()
    @indicators.reset options.indicators

  routes:
    "/new"      : "newIndicator"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newIndicator: ->
    @view = new BIPIndicatorsPage.Views.Indicators.NewView(collection: @indicators)
    $("#indicators").html(@view.render().el)

  index: ->
    @view = new BIPIndicatorsPage.Views.Indicators.IndexView(indicators: @indicators)
    $("#indicators").html(@view.render().el)

  show: (id) ->
    indicator = @indicators.get(id)

    @view = new BIPIndicatorsPage.Views.Indicators.ShowView(model: indicator)
    $("#indicators").html(@view.render().el)

  edit: (id) ->
    indicator = @indicators.get(id)

    @view = new BIPIndicatorsPage.Views.Indicators.EditView(model: indicator)
    $("#indicators").html(@view.render().el)
