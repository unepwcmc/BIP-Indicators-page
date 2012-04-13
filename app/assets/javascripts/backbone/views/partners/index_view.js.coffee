BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.IndexView extends Backbone.View
  template: JST["backbone/templates/partners/index"]

  tagName: 'select'

  events:
    'change': 'select'

  initialize: () ->
    @options.partners.bind('reset', @addAll)

  addAll: () =>
    @options.partners.each(@addOne)

  addOne: (partner) =>
    view = new BIPIndicatorsPage.Views.Partners.PartnerView({model : partner})
    @$el.append(view.render().el)

  render: =>
    @$el.attr('id', 'partner')
    @$el.html(@template(partners: @options.partners.toJSON() ))
    @addAll()

    return this

  select: =>
    partnerId = @$el.find("option:selected").val()
    router.filterByPartner(partnerId)
