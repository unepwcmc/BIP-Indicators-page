BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.ShowView extends Backbone.View
  template: JST["backbone/templates/indicators/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
