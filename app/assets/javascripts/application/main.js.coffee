pageLoad = ->
  $(".autosize").autosize()
  $("textarea.hashtags").hashtags()
  console.log("pageLoad")

# $(document).ready(ready)
# $(document).on('page:load', ready)

head ->
  $ ->
    $(document).on 'ready page:load page:change page:restore page:update', ->
      pageLoad()
      true