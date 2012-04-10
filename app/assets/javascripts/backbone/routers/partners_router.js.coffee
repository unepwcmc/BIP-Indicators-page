class BIPIndicatorsPage.Routers.PartnersRouter extends Backbone.Router
  initialize: (options) ->
    @partners = new BIPIndicatorsPage.Collections.PartnersCollection()
    @partners.reset options.partners

  routes:
    "/new"      : "newPartner"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newPartner: ->
    @view = new BIPIndicatorsPage.Views.Partners.NewView(collection: @partners)
    $("#partners").html(@view.render().el)

  index: ->
    @view = new BIPIndicatorsPage.Views.Partners.IndexView(partners: @partners)
    $("#partners").html(@view.render().el)

  show: (id) ->
    partner = @partners.get(id)

    @view = new BIPIndicatorsPage.Views.Partners.ShowView(model: partner)
    $("#partners").html(@view.render().el)

  edit: (id) ->
    partner = @partners.get(id)

    @view = new BIPIndicatorsPage.Views.Partners.EditView(model: partner)
    $("#partners").html(@view.render().el)
