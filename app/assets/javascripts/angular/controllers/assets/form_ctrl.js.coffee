@AssetFormCtrl = [ "$scope", "$fileUploader", "$window", ($scope, $fileUploader, $window) ->

  $scope.assets = []

  uploader = $scope.uploader = $fileUploader.create
    headers : {
      'X-CSRF-TOKEN' : $('meta[name=csrf-token]').attr('content')
    },
    scope: $scope
    url: "/assets.json"
    autoUpload: true
    removeAfterUpload: true
    alias: "asset[file]"

  uploader.bind 'success', (event, xhr, item, response) ->
    $scope.assets.push(response)

  $scope.addPost = (el, $event) ->
    $event.preventDefault()
    form = $($event.currentTarget)
    req = $.ajax
      url: form.action
      method: "POST"
      dataType: "jsonp"
      data: form.serialize()
      headers :
       'X-CSRF-TOKEN' : $('meta[name=csrf-token]').attr('content')
    $scope.assets = []
    return false

]