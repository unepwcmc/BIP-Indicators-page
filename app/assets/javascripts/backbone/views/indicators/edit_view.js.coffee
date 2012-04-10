BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.EditView extends Backbone.View
  template : JST["backbone/templates/indicators/edit"]

  events :
    "submit #edit-indicator" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (indicator) =>
        @model = indicator
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
