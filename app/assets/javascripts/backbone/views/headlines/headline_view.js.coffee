BIPIndicatorsPage.Views.Headlines ||= {}

class BIPIndicatorsPage.Views.Headlines.HeadlineView extends Backbone.View
  template: JST["backbone/templates/headlines/headline"]

  events:
    "click .select-headline" : "select"

  initialize: ->
   @model.on('change', @render)

  select: () ->
    @model.select()
    return false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    $(@el).addClass('row-fluid')
    counterEl = $(@el).find('.headlines-indicator-count')
    counterEl.removeClass()
    counterEl.addClass("indicator-cnt-#{@model.get('indicatorCntClass')} headlines-indicator-count span2")
    return this
