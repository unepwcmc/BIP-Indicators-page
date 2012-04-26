BIPIndicatorsPage.Views.Targets ||= {}

class BIPIndicatorsPage.Views.Targets.TargetView extends Backbone.View
  template: JST["backbone/templates/targets/target"]

  events:
    "click": "select"

  initialize: ->
   @model.on('change', @render)

  select: () ->
    @$el.find('.keyword').tooltip('hide')
    @model.select()

  render: =>
    @$el.html(@template(@model.toJSON() ))
    @$el.removeClass()
    @$el.addClass("indicator-cnt-#{@model.get('indicatorCntClass')}")
    @$el.find('.keyword').tooltip({placement: 'right'})
    if (@model.get('selected'))
      @$el.addClass('selected')
    else
      @$el.removeClass('selected')
    return this
