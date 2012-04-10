BIPIndicatorsPage.Views.Targets ||= {}

class BIPIndicatorsPage.Views.Targets.TargetView extends Backbone.View
  template: JST["backbone/templates/targets/target"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
