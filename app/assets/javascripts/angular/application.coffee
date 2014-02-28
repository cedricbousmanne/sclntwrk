#= require_self
#= require_tree ./controllers
#= require_tree ./filters
#= require_tree ./services
#= require_tree ./widgets

# window.app = angular.module("communityEngine", ["angularFileUpload"])

# window.app.config ["$httpProvider", ($httpProvider) ->
#   $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
# ]

@app = angular.module("communityEngine", ["angularFileUpload"])

@app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

$(document).on('ready page:load', ->
  angular.bootstrap("body", ['communityEngine'])
)

moment.lang("fr")