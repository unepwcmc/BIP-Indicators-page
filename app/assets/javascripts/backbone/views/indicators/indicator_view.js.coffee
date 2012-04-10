BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.IndicatorView extends Backbone.View
  template: JST["backbone/templates/indicators/indicator"]

  render: =>
    $(@el).html(@template(@model.toJSON() )) if @model.get('show')
    return this
