class Application.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    content: null

class Application.Collections.CommentsCollection extends Backbone.Collection
  model: Application.Models.Comment
  url: '/comments'
