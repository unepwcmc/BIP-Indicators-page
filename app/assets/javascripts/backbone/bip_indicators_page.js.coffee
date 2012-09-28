#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BIPIndicatorsPage =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  isTouchDevice: () ->
    return !!('ontouchstart' in window);
