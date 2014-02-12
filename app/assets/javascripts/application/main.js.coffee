ready = ->
  $(".autosize").autosize()
  $("textarea.hashtags").hashtags()

$(document).ready(ready)
$(document).on('page:load', ready)