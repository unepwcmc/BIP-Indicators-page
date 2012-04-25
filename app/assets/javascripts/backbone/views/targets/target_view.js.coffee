BIPIndicatorsPage.Views.Targets ||= {}

class BIPIndicatorsPage.Views.Targets.TargetView extends Backbone.View
  template: JST["backbone/templates/targets/target"]

  events:
    "click": "select"

  initialize: ->
   @model.on('change', @render)

  select: () ->
    @model.select()
    return false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    $(@el).removeClass()
    $(@el).addClass("indicator-cnt-#{@model.get('indicatorCntClass')}")
    if (@model.get('selected'))
      $(@el).addClass("selected")
    else
      $(@el).removeClass("selected")
    return this
