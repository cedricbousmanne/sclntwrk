@AssetFormCtrl = [ "$scope", "$fileUploader", "$window", ($scope, $fileUploader, $window) ->
  $(document).on('ready page:load', ->
    $scope.assets = []
    $scope.files  = []

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
      if(response["image"])
        $scope.assets.push(response)
      else
        $scope.files.push(response)
        console.log(response)
  )

  $scope.addPost = (el, $event) ->
    $event.preventDefault()
    form = $($event.currentTarget)
    req = $.ajax
      url: form.attr("action")
      method: "POST"
      dataType: "jsonp"
      data: form.serialize()
      headers :
       'X-CSRF-TOKEN' : $('meta[name=csrf-token]').attr('content')
    $scope.assets = []
    $scope.files  = []
    return false

]
