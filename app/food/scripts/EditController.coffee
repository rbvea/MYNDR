angular
  .module('food')
  .controller("EditController", ($scope, Food, supersonic) ->
    $scope.food = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Food.find(values.id).then (food) ->
        $scope.$apply ->
          $scope.food = food
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.food.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
