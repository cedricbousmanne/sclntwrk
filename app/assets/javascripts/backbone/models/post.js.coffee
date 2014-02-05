class Application.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    content: null

class Application.Collections.PostsCollection extends Backbone.Collection
  model: Application.Models.Post
  url: '/posts.json'
