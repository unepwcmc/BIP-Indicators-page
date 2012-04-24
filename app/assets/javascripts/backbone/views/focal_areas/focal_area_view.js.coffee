BIPIndicatorsPage.Views.FocalAreas ||= {}

class BIPIndicatorsPage.Views.FocalAreas.FocalAreaView extends Backbone.View
  template: JST["backbone/templates/focal_areas/focal_area"]

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    $(@el).find('div').addClass("indicator-cnt-#{@model.get('indicatorCntClass')}")
    return this
