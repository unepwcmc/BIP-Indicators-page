BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.EditView extends Backbone.View
  template : JST["backbone/templates/partners/edit"]

  events :
    "submit #edit-partner" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (partner) =>
        @model = partner
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
