BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.ShowView extends Backbone.View
  template: JST["backbone/templates/partners/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
