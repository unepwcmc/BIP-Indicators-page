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
    $(@el).removeClass()
    $(@el).addClass("indicator-cnt-#{@model.get('indicatorCntClass')}")
    return this
