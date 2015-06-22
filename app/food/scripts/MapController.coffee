angular
  .module('food')
  .controller "MapController", ($scope, Food, supersonic, $http) ->
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

    # icon = L.mapbox.marker.icon
    #   'marker-color': '00B5FF'

    icon = L.divIcon
      className: 'myndr-marker'

    markers = []

    $scope.showDetail = (id) ->
      supersonic.ui.views.find 'food#show'
        .then (view) ->
          supersonic.ui.layers.push view ,
            params:
              id: id
      return

    window.showDetail = $scope.showDetail

    $scope.triggerPopup = (food) ->
      for marker in markers
        if marker._icon.alt == food.Name
          marker.openPopup()
          break
      return

    Food.all().whenChanged (foods) ->
      $scope.$apply ->
        $scope.foods = foods
        $scope.showSpinner = false
        for food,i in $scope.foods
          center = latlngs[i]
          if center
            marker = new L.marker center,
              icon: icon
              alt: food.Name
            marker.bindPopup """
              <h4 class="myndr-popup-title">#{food.Name}</h4>
              <a href="" class="myndr-popup-link" onclick="showDetail('#{food.id}')" data-id="#{food.id}">Show More</a>
            """
            marker.addTo $scope.map
            markers.push marker
        links = document.querySelectorAll '.myndr-popup-link'
        for link in links
          link.addEventListener 'click', () ->
            id = this.getAttribute 'data-id'
            $scope.showDetail i
