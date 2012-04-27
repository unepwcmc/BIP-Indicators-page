BIPIndicatorsPage.Views.Partners ||= {}

class BIPIndicatorsPage.Views.Partners.IndexView extends Backbone.View
  template: JST["backbone/templates/partners/index"]

  tagName: 'select'

  events:
    'change': 'select'

  initialize: () ->
    @options.partners.bind('reset', @addAll)
    @options.partners.bind('change', @render)

  addAll: () =>
    _.each(@options.partners.sort({silent: true}).valid(), @addOne)

  addOne: (partner) =>
    view = new BIPIndicatorsPage.Views.Partners.PartnerView({model : partner})
    $(view.el).attr('selected','selected') if partner.selected
    @$el.append(view.render().el)

  render: =>
    @$el.attr('id', 'partner')
    @$el.html(@template(partners: @options.partners.toJSON() ))
    @addAll()

    return this

  select: =>
    partnerId = @$el.find("option:selected").val()
    if partnerId
      partner = @options.partners.get(partnerId)
      partner.select()
    else
      @options.partners.deselectAll()
      router.filterByPartner()
