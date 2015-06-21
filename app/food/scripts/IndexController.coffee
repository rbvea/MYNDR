angular
  .module('food')
  .controller("IndexController", ($scope, Food, supersonic) ->
    $scope.foods = null
    $scope.showSpinner = true

    Food.all().whenChanged (foods) ->
      $scope.$apply ->
        $scope.foods = foods
        $scope.showSpinner = false
  )