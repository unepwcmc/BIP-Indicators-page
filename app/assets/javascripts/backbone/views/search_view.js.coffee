class BIPIndicatorsPage.Views.SearchView extends Backbone.View
  template: JST["backbone/templates/search"]

  initialize: ->
    $.widget("custom.catcomplete", $.ui.autocomplete, {
    _renderMenu: ( ul, items ) ->
      self = this
      currentCategory = ""
      $.each( items, ( index, item ) ->
        if ( item.category != currentCategory )
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" )
          currentCategory = item.category
        self._renderItem( ul, item )
      )
    _renderItem: ( ul, item ) ->
      link = "<a>" + item.label + "</a>"
      if item.category == 'indicator'
        link = "<a href = " + item.link + ">" + item.label + "</a>"
      return $( "<li data-id = " + item.id + " data-category = '" + item.category + "'" + " data-link = '" + item.link + "'></li>" )
        .data( "item.autocomplete", item )
        .append(link)
        .appendTo( ul );
    })

  render: =>
    $(@el).html(@template())
    $(@el).find('input').catcomplete({
      delay: 0,
      source: @options.ftsData,
      select: (event, ui) ->
        if ui.item.category == 'indicator'
          window.location = ui.item.link
        else
          router.activateByCategory(ui.item.category, ui.item.id)
    });
    return this
