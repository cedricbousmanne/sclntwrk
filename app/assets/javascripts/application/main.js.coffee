window.bindablePlugins = () ->
  $(".autosize").autosize()
  $("textarea.hashtags").hashtags()


$(document).ready () ->

  bindablePlugins()