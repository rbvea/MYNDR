angular
  .module('food')
  .controller("CaptureController", ($scope, Food, supersonic) ->
    $scope.food = {}
    $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      newfood = new Food($scope.food)
      newfood.Favorite = true
      newfood.Location = 'http://i739.photobucket.com/albums/xx38/mattchinnock/Screen%20Shot%202015-06-20%20at%203.15.51%20PM_zpsqyqmtyfe.png'
      newfood.User = 'Michelle'
      newfood.Image = 'data:image/jpg;base64,' + $scope.image
      newfood.save().then ->
        supersonic.ui.views.stop("food#capture")
        supersonic.ui.views.start("food#capture") 
        supersonic.ui.modal.hide()
        supersonic.ui.tabs.select 0

    $scope.cancel = ->
      supersonic.ui.modal.hide()
      supersonic.ui.tabs.select 0
  

   
    $scope.unsubscribe = supersonic.ui.views.current.whenVisible ->
      options =
        quality: 100
        allowEdit: true
        targetWidth: 750
        targetHeight: 750
        encodingType: "jpg"
        destinationType: 'dataURL'
        saveToPhotoAlbum: false
      supersonic.media.camera.takePicture(options).then (result) ->
        $scope.image = result
        console.log($scope.unsubscribe)
      $scope.unsubscribe()

    

      


    
      

)        