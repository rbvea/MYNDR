angular
  .module('food')
  .controller("FavController", ($scope, Food, supersonic) ->
    $scope.foods = null
    $scope.showSpinner = true


    query = { "Favorite": true }    
    Food.findAll({query: JSON.stringify(query)}).then (foods) ->
    	$scope.$apply ->
        $scope.foods = foods
        $scope.showSpinner = false

)        