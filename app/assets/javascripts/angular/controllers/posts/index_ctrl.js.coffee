@PostIndexCtrl = [ "$scope", "$window", ($scope, $window) ->
  # $scope.album = $window.album

  # uploader = $scope.uploader = $fileUploader.create
  #   scope: $scope
  #   url: "/albums/#{$scope.album.id}/pictures.json"
  #   autoUpload: true
  #   removeAfterUpload: true

  # uploader.bind 'success', (event, xhr, item, response) ->
  #   $scope.album.pictures.push(response)
]