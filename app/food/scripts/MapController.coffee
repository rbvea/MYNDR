test = () ->
  alert 'test'

angular
  .module('food')
  .controller("MapController", ($scope, Food, supersonic, $http) ->
    $scope.foods = null
    $scope.showSpinner = true

    L.mapbox.accessToken = "pk.eyJ1IjoicnVzc2VsbGJ2ZWEiLCJhIjoiMjQwMzBmYTllYTRmZWE1NjZkZGM1NzdjMTA3Y2UxYmIifQ.FZkQoy4pO6At7mRCqTODaQ"
    $scope.map = L.mapbox.map 'map', 'russellbvea.mcm2aegd',
      center: [21.456277, -158.001277]
      zoom: 10

    latlngs = [
      [21.458094, -158.013221],
      [21.282297, -157.798817],
      [21.292652, -157.850059],
    ]

    Food.all().whenChanged (foods) ->
      $scope.$apply ->
        $scope.foods = foods
        $scope.showSpinner = false
        for food,i in $scope.foods
          center = latlngs[i]
          if center
            icon = L.mapbox.marker.icon
              'marker-color': '00B5FF'
            marker = new L.marker center,
              icon: icon
            marker.addTo $scope.map
            supersonic.ui.views.current.stop()
            supersonic.ui.views.start 'food#show'
  )
