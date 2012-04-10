BIPIndicatorsPage.Views.Targets ||= {}

class BIPIndicatorsPage.Views.Targets.ShowView extends Backbone.View
  template: JST["backbone/templates/targets/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
