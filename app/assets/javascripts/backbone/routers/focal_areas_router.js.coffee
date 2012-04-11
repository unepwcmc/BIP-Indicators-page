class BIPIndicatorsPage.Routers.FocalAreasRouter extends Backbone.Router
  initialize: (options) ->
    @focalAreas = new BIPIndicatorsPage.Collections.FocalAreasCollection()
    @focalAreas.reset options.focalAreas

  routes:
    "/new"      : "newFocalArea"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newFocalArea: ->
    @view = new BIPIndicatorsPage.Views.FocalAreas.NewView(collection: @focal_areas)
    $("#focal_areas").html(@view.render().el)

  index: ->
    @view = new BIPIndicatorsPage.Views.FocalAreas.IndexView(focal_areas: @focal_areas)
    $("#focal_areas").html(@view.render().el)

  show: (id) ->
    focal_area = @focal_areas.get(id)

    @view = new BIPIndicatorsPage.Views.FocalAreas.ShowView(model: focal_area)
    $("#focal_areas").html(@view.render().el)

  edit: (id) ->
    focal_area = @focal_areas.get(id)

    @view = new BIPIndicatorsPage.Views.FocalAreas.EditView(model: focal_area)
    $("#focal_areas").html(@view.render().el)
