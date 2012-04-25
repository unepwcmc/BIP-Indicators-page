class BIPIndicatorsPage.Models.Partner extends Backbone.Model
  paramRoot: 'partner'

  defaults:
    code: null
    name: null
    # extra fields for interface
    selected: false

  select: ->
    @collection.deselectAll()
    @save({'selected': true})
    router.filterByPartner(@)

  deselect: ->
    @save({'selected': false})

class BIPIndicatorsPage.Collections.PartnersCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Partner
  localStorage: new Store("bip_partners")

  saveAll: ->
    _.each @models, (target) ->
      target.save()

  deselectAll: ->
    _.each @models, (partner) ->
      partner.deselect()

  selected: ->
    @filter (partner) ->
      partner.get('selected')
