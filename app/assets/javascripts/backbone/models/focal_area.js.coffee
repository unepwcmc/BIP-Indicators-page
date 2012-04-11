class BIPIndicatorsPage.Models.FocalArea extends Backbone.Model
  paramRoot: 'focal_area'

  defaults:
    name: null
    # extra fields for interface
    selected: false

  select: ->
    @collection.deselectAll()
    @set({'selected': true})

  deselect: ->
    @set({'selected': false})

class BIPIndicatorsPage.Collections.FocalAreasCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.FocalArea
  url: '/focal_areas'

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()

  selected: ->
    @filter (headline) ->
      headline.get('selected')
