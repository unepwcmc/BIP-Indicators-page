class BIPIndicatorsPage.Views.SearchView extends Backbone.View
  template: JST["backbone/templates/search"]

  initialize: ->
    $.widget "custom.catcomplete", $.ui.autocomplete,
      _renderMenu: (ul, items) ->
        currentCategory = ""
        currentItem = 0
        maxItems = 5
        $.each items, (index, item ) =>
          if(item.category != currentCategory)
            ul.append("<li class='ui-autocomplete-category'>#{item.category}</li>")
            currentCategory = item.category
            currentItem = 0
          if(currentItem < 5)
            @._renderItem(ul, item)
          currentItem += 1

      _renderItem: (ul, item) ->
        link = "<a href=\"#\">#{item.label}</a>"
        if item.category == 'indicator'
          link = "<a href=\"#\" onclick=\"window.top.location.href='#{item.link}'; return false;\">#{item.label}</a>"

        $("<li data-id=\"#{item.id}\" data-category=\"#{item.category}\" data-link=\"#{item.link}\"></li>")
          .data( "item.autocomplete", item )
          .append(link)
          .appendTo(ul)

  render: =>
    $(@el).html(@template())
    $(@el).find('input').catcomplete
      delay: 0
      source: @options.ftsData
      select: (event, ui) ->
        if ui.item.category == 'indicator'
          window.location = ui.item.link
        else
          router.activateByCategory(ui.item.category, ui.item.id)
        return false
    return this
