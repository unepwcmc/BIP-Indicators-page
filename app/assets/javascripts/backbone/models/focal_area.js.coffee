class BIPIndicatorsPage.Models.FocalArea extends Backbone.Model
  paramRoot: 'focal_area'

  defaults:
    code: null
    name: null
    question: null
    # extra fields for interface
    selected: false

  select: ->
    @collection.deselectAll()
    @save({'selected': true})

  deselect: ->
    @save({'selected': false})

class BIPIndicatorsPage.Collections.FocalAreasCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.FocalArea
  localStorage: new Store("bip_focal_areas")

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()

  selected: ->
    @filter (headline) ->
      headline.get('selected')
