BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.NewView extends Backbone.View
  template: JST["backbone/templates/partners/new"]

  events:
    "submit #new-partner": "save"

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
      success: (partner) =>
        @model = partner
        window.location.hash = "/#{@model.id}"

      error: (partner, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
