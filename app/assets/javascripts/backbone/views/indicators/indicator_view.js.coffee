BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.IndicatorView extends Backbone.View
  template: JST["backbone/templates/indicators/indicator"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
