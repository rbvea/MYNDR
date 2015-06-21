angular
  .module('food')
  .controller("IndexController", ($scope, Food, supersonic, $timeout) ->
    $scope.foods = null
    $scope.showSpinner = true

    Food.all().whenChanged (foods) ->
      $scope.$apply ->
        $scope.foods = foods
        $scope.showSpinner = false

   	$scope.selectCloud = (event) ->   
   		angular.element(event.toElement).addClass('blue')
   		$scope.flashCloud(event.toElement.parentNode)
   		console.log(event)
   		return 

   	$scope.flashCloud = (event) ->    
   		angular.element(event.children[0].children[1]).addClass('flash')
   		$timeout($scope.callAtTimeout(event), 5000)
   		return

   	$scope.callAtTimeout = (event) ->  
   		console.log(event)  

  )