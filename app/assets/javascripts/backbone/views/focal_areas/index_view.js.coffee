BIPIndicatorsPage.Views.FocalAreas ||= {}

class BIPIndicatorsPage.Views.FocalAreas.IndexView extends Backbone.View
  template: JST["backbone/templates/focal_areas/index"]

  initialize: () ->
    @options.focalAreas.bind('reset', @addAll)

  addAll: () =>
    @options.focalAreas.each(@addOne)

  addOne: (focalArea) =>
    view = new BIPIndicatorsPage.Views.FocalAreas.FocalAreaView({model : focalArea})
    @$("#focal-areas-container").append(view.render().el)

  render: =>
    $(@el).html(@template(focalAreas: @options.focalAreas.toJSON() ))
    @addAll()

    return this
