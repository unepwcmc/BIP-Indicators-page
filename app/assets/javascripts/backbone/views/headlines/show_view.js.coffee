BIPIndicatorsPage.Views.Headlines ||= {}

class BIPIndicatorsPage.Views.Headlines.ShowView extends Backbone.View
  template: JST["backbone/templates/headlines/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
