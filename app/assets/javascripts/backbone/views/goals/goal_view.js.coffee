BIPIndicatorsPage.Views.Goals ||= {}

class BIPIndicatorsPage.Views.Goals.GoalView extends Backbone.View
  template: JST["backbone/templates/goals/goal"]

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    $(@el).addClass('row-fluid')
    # Targets
    @targetsView = new BIPIndicatorsPage.Views.Targets.IndexView(targets: @model.targets)
    $(@el).find(".targets").html(@targetsView.render().el)

    return this
