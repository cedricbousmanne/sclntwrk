Application.Views.Posts ||= {}

class Application.Views.Posts.IndexView extends Backbone.View
  el: 'body'
  events:
    "click .show-comments"              : "showComments"
    "keydown .comment_content textarea" : "submitComment"

  initialize: () ->
    $(".new_comment input[type='submit']").hide()

  authenticityToken: () ->
    $("meta[name='csrf-token']").attr("content")

  showComments: (e) ->
    e.preventDefault()
    showCommentTag = $(e.target).parents(".show-comments")
    showCommentTag.siblings(".hidden").removeClass("hidden")
    showCommentTag.remove()

  submitComment: (e) =>
    form = $(e.target).parents("form")
    if(e.keyCode == 13)
      e.preventDefault()
      $.ajax({
        type: "POST",
        url:  form.attr("action") + "?&authenticity_token=" + this.authenticityToken(),
        data: form.serialize(),
        dataType: "script"
      });
      return false;