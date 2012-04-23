BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.PartnerView extends Backbone.View
  template: JST["backbone/templates/partners/partner"]

  tagName: "option"

  render: ->
    @$el.val(@model.get('id'))
    if @model.get('selected')
      @$el.attr('selected', 'selected')
    @$el.html(@template(@model.toJSON() ))
    return this
