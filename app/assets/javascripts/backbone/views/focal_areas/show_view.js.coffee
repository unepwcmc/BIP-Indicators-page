BIPIndicatorsPage.Views.FocalAreas ||= {}

class BIPIndicatorsPage.Views.FocalAreas.ShowView extends Backbone.View
  template: JST["backbone/templates/focal_areas/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
