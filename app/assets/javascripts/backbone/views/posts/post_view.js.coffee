Application.Views.Posts ||= {}

class Application.Views.Posts.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]

  events:
    "click .destroy" : "destroy"

  tagName: "div.publication-item.post-item"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
