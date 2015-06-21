angular
  .module('food')
  .controller("ShowController", ($scope, Food, supersonic) ->
    $scope.food = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Food.find($scope.dataId).then (food) ->
        $scope.$apply ->
          $scope.food = food
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.food.delete().then ->
        supersonic.ui.layers.pop()
  )
