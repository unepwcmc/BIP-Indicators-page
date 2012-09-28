BIPIndicatorsPage.Views.Targets ||= {}

class BIPIndicatorsPage.Views.Targets.TargetView extends Backbone.View
  template: JST["backbone/templates/targets/target"]

  events: ()->
    if window.BIPIndicatorsPage.isTouchDevice()
      "touchstart": "showPreview"
      "touchend": "hidePreview"
      "click": "select"
    else
      "mouseenter": "showPreview"
      "mouseleave": "hidePreview"
      "click": "select"

  initialize: ->
   @model.on('change', @render)

  showPreview: () ->
    @$el.tooltip('show')

  hidePreview: () ->
    @$el.tooltip('hide')

  select: () ->
    @$el.tooltip('hide')
    @model.select()
    @$el.removeAttr('title')

  render: =>
    @$el.html(@template(@model.toJSON() ))
    @$el.removeClass()
    @$el.addClass("indicator-cnt-#{@model.get('indicatorCntClass')}")
    @$el.attr('title',@model.get('title'))
    @$el.tooltip({placement: 'right', trigger: 'manual'})
    if (@model.get('selected'))
      @$el.addClass('selected')
    else
      @$el.removeClass('selected')
    return this
