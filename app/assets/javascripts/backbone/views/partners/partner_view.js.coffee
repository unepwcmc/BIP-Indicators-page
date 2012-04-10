BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.PartnerView extends Backbone.View
  template: JST["backbone/templates/partners/partner"]

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
