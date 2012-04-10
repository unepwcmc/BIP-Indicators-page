BIPIndicatorsPage.Views.Targets ||= {}

class BIPIndicatorsPage.Views.Targets.IndexView extends Backbone.View
  template: JST["backbone/templates/targets/index"]

  initialize: () ->
    @options.targets.bind('reset', @addAll)

  addAll: () =>
    @options.targets.each(@addOne)

  addOne: (target) =>
    view = new BIPIndicatorsPage.Views.Targets.TargetView({model : target})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(targets: @options.targets.toJSON() ))
    @addAll()

    return this
