angular
  .module('food')
  .controller("NewController", ($scope, Food, supersonic) ->
    $scope.food = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newfood = new Food($scope.food)
      newfood.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
