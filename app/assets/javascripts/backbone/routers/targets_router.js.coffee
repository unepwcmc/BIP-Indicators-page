class BIPIndicatorsPage.Routers.TargetsRouter extends Backbone.Router
  initialize: (options) ->
    @targets = new BIPIndicatorsPage.Collections.TargetsCollection()
    @targets.reset options.targets

  routes:
    "/new"      : "newTarget"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newTarget: ->
    @view = new BIPIndicatorsPage.Views.Targets.NewView(collection: @targets)
    $("#targets").html(@view.render().el)

  index: ->
    @view = new BIPIndicatorsPage.Views.Targets.IndexView(targets: @targets)
    $("#targets").html(@view.render().el)

  show: (id) ->
    target = @targets.get(id)

    @view = new BIPIndicatorsPage.Views.Targets.ShowView(model: target)
    $("#targets").html(@view.render().el)

  edit: (id) ->
    target = @targets.get(id)

    @view = new BIPIndicatorsPage.Views.Targets.EditView(model: target)
    $("#targets").html(@view.render().el)
