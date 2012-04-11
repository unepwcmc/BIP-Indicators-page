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
    return this
