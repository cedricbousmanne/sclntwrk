@CommentIndexCtrl = [ "$scope", "$window", ($scope, $window) ->

  $(".new_comment input[type='submit']").hide()

  $scope.showHiddenComments = (element,$event) ->
    $event.preventDefault
    container = $($event.currentTarget).parents(".commentable-container")

    container.find(".comment-item.hidden").removeClass("hidden")
    container.find(".show-comments").remove()

    return true

  $scope.submitOnEnter = (element, $event) ->
    $event.preventDefault
    form = $($event.currentTarget).parents("form")
    form.submit

]