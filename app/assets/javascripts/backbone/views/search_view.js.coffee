class BIPIndicatorsPage.Views.SearchView extends Backbone.View
  template: JST["backbone/templates/search"]

  initialize: ->
    console.log(@options.ftsData)
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
      return $( "<li data-id = " + item.id + " data-category = '" + item.category + "'></li>" )
        .data( "item.autocomplete", item )
        .append( "<a>" + item.label + "</a>" )
        .appendTo( ul );
    })

  render: =>
    $(@el).html(@template())
    $(@el).find('input').catcomplete({
      delay: 0,
      source: @options.ftsData,
      select: (event, ui) ->
        if ui.item.category == 'indicator'
          #TODO go directly to the indicator's page
          console.log('indicator')
        else
          console.log('sth else')
          router.activateByCategory(ui.item.category, ui.item.id)
    });
    return this
