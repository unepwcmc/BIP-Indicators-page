BIPIndicatorsPage.Views.Headlines ||= {}

class BIPIndicatorsPage.Views.Headlines.NewView extends Backbone.View
  template: JST["backbone/templates/headlines/new"]

  events:
    "submit #new-headline": "save"

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
      success: (headline) =>
        @model = headline
        window.location.hash = "/#{@model.id}"

      error: (headline, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
