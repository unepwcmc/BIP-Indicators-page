BIPIndicatorsPage.Views.Headlines ||= {}

class BIPIndicatorsPage.Views.Headlines.HeadlineView extends Backbone.View
  template: JST["backbone/templates/headlines/headline"]

  events:
    "click" : "select"

  initialize: ->
   @model.on('change', @render)

  select: () ->
    @model.select()
    return false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    $(@el).addClass('headline')
    counterEl = $(@el).find('.indicator-count')
    counterEl.removeClass()
    counterEl.addClass("indicator-cnt-#{@model.get('indicatorCntClass')} indicator-count")
    return this
