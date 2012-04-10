BIPIndicatorsPage.Views.Headlines ||= {}

class BIPIndicatorsPage.Views.Headlines.EditView extends Backbone.View
  template : JST["backbone/templates/headlines/edit"]

  events :
    "submit #edit-headline" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (headline) =>
        @model = headline
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
