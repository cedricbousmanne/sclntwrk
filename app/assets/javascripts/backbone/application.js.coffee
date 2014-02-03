#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Application =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

# $(document).ready ->
#   Application.initialize()

# $(document).on 'page:load', ->
#   Backbone.history.stop()
#   Application.initialize()