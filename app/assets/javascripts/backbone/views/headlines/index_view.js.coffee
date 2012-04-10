BIPIndicatorsPage.Views.Headlines ||= {}

class BIPIndicatorsPage.Views.Headlines.IndexView extends Backbone.View
  template: JST["backbone/templates/headlines/index"]

  initialize: () ->
    @options.headlines.bind('reset', @addAll)

  addAll: () =>
    @options.headlines.each(@addOne)

  addOne: (headline) =>
    view = new BIPIndicatorsPage.Views.Headlines.HeadlineView({model : headline})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(headlines: @options.headlines.toJSON() ))
    @addAll()

    return this
