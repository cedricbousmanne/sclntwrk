Application.Views.Posts ||= {}

class Application.Views.Posts.IndexView extends Backbone.View
  el: 'body'
  # template: JST["backbone/templates/posts/index"]
  # newTemplate: JST["backbone/templates/posts/new"]
  # newEl: "#new-post-container"
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

    # @options.posts.bind('reset', @addAll)
    # @model = new Application.Models.Post
    # @newPost = @model.toJSON()
    # console.log(@newPost)

  # addAll: () =>
  #   @options.posts.each(@addOne)

  # addOne: (post) =>
  #   view = new Application.Views.Posts.PostView({model : post})
  #   @$("#posts-container").append(view.render().el)

  # render: =>
  #   console.log(@newEl)
  #   $(@newEl).html(@newTemplate(@model.toJSON() ))
  #   $(@el).html(@template(posts: @options.posts.toJSON() ))
  #   @addAll()

  #   return this