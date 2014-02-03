class Application.Views.ApplicationView extends Backbone.View

  initialize: () ->
    new @options.view(@options.view_data || {}) if @options.view