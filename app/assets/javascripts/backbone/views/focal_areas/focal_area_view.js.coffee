BIPIndicatorsPage.Views.FocalAreas ||= {}

class BIPIndicatorsPage.Views.FocalAreas.FocalAreaView extends Backbone.View
  template: JST["backbone/templates/focal_areas/focal_area"]

  events:
    "click .select-focal-area" : "select"

  initialize: ->
   @model.on('change', @render)

  select: () ->
    @model.select()
    return false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    $(@el).addClass('span3')
    $(@el).find('div').removeClass()
    $(@el).find('div').addClass("indicator-cnt-#{@model.get('indicatorCntClass')} focal-areas-indicator-count")
    return this
