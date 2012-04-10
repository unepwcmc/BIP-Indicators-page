class BIPIndicatorsPage.Routers.HeadlinesRouter extends Backbone.Router
  initialize: (options) ->
    @headlines = new BIPIndicatorsPage.Collections.HeadlinesCollection()
    @headlines.reset options.headlines

  routes:
    "/new"      : "newHeadline"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newHeadline: ->
    @view = new BIPIndicatorsPage.Views.Headlines.NewView(collection: @headlines)
    $("#headlines").html(@view.render().el)

  index: ->
    @view = new BIPIndicatorsPage.Views.Headlines.IndexView(headlines: @headlines)
    $("#headlines").html(@view.render().el)

  show: (id) ->
    headline = @headlines.get(id)

    @view = new BIPIndicatorsPage.Views.Headlines.ShowView(model: headline)
    $("#headlines").html(@view.render().el)

  edit: (id) ->
    headline = @headlines.get(id)

    @view = new BIPIndicatorsPage.Views.Headlines.EditView(model: headline)
    $("#headlines").html(@view.render().el)
