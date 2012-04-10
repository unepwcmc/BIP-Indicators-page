BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.NewView extends Backbone.View
  template: JST["backbone/templates/indicators/new"]

  events:
    "submit #new-indicator": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (indicator) =>
        @model = indicator
        window.location.hash = "/#{@model.id}"

      error: (indicator, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
