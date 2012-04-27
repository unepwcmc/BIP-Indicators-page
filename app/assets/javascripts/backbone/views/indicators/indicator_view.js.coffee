BIPIndicatorsPage.Views.Indicators ||= {}

class BIPIndicatorsPage.Views.Indicators.IndicatorView extends Backbone.View
  template: JST["backbone/templates/indicators/indicator"]

  tagName: 'a'
  className: 'indicator'

  events:
    "mouseover": "highlight",
    "mouseout": "dehighlight"

  highlight: ->
    $(@el).addClass('highlighted')

  dehighlight: ->
    $(@el).removeClass('highlighted')

  render: =>
    @$el.html(@template(@model.toJSON() )) if @model.get('show')
    @$el.attr('href', @model.get('link')).attr('target', '_parent')
    return this
