Application.Views.Posts ||= {}

class Application.Views.Posts.IndexView extends Backbone.View
  el : "body"

  events:
    "click .post-meta-add-comment" : "loadComments"

  initialize: () ->

  loadComments: (event) =>
    container = $(event.target).parents(".publication-item")
    console.log(container.data("publication-id"))

