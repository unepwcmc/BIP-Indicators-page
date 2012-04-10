BIPIndicatorsPage.Views.Goals ||= {}

class BIPIndicatorsPage.Views.Goals.IndexView extends Backbone.View
  template: JST["backbone/templates/goals/index"]

  initialize: () ->
    @options.goals.bind('reset', @addAll)

  addAll: () =>
    @options.goals.each(@addOne)

  addOne: (goal) =>
    view = new BIPIndicatorsPage.Views.Goals.GoalView({model : goal})
    @$("#goals-container").append(view.render().el)

  render: =>
    $(@el).html(@template(goals: @options.goals.toJSON() ))
    @addAll()

    return this
