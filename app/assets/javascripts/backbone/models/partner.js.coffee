class BIPIndicatorsPage.Models.Partner extends Backbone.Model
  paramRoot: 'partner'

  defaults:
    code: null
    name: null
    indicators: []
    indicators_ids: ''
    # extra fields for interface
    selected: false

  initialize: ->
    @set({indicators_ids: _.pluck(@get('indicators'), 'id').join(',')})

  select: ->
    @collection.deselectAll()
    @save({'selected': true})
    router.filterByPartner(@)

  deselect: ->
    @save({'selected': false})

class BIPIndicatorsPage.Collections.PartnersCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Partner
  localStorage: new Store("bip_partners")

  comparator: (partner) ->
    partner.get('name')

  saveAll: ->
    _.each @models, (target) ->
      target.save()

  deselectAll: ->
    _.each @models, (partner) ->
      partner.deselect()

  selected: ->
    @filter (partner) ->
      partner.get('selected')

  valid: ->
    @filter (partner) ->
      partner.get('indicators_ids').length > 0 && partner.get('indicators_ids').split(',').length > 0
