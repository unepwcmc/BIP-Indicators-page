BIPIndicatorsPage.Views.FocalAreas ||= {}

class BIPIndicatorsPage.Views.FocalAreas.EditView extends Backbone.View
  template : JST["backbone/templates/focal_areas/edit"]

  events :
    "submit #edit-focal_area" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (focal_area) =>
        @model = focal_area
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
