BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.IndexView extends Backbone.View
  template: JST["backbone/templates/partners/index"]

  initialize: () ->
    @options.partners.bind('reset', @addAll)

  addAll: () =>
    @options.partners.each(@addOne)

  addOne: (partner) =>
    view = new BIPIndicatorsPage.Views.Partners.PartnerView({model : partner})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(partners: @options.partners.toJSON() ))
    @addAll()

    return this
