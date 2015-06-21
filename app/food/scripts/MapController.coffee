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
      tap: false

    latlngs = [
      [21.458094, -158.013221],
      [21.282297, -157.798817],
      [21.292652, -157.850059],
    ]

    icon = L.mapbox.marker.icon
      'marker-color': '00B5FF'

    Food.all().whenChanged (foods) ->
      $scope.$apply ->
        $scope.foods = foods
        $scope.showSpinner = false
        for food,i in $scope.foods
          center = latlngs[i]
          if center
            marker = new L.marker center,
              icon: icon
            marker.addEventListener 'click' , () ->
              supersonic.ui.views.find 'food#show'
                .then (view) ->
                  supersonic.ui.layers.push view
                .error (err) ->
                  console.log err
            marker.addTo $scope.map

  )
