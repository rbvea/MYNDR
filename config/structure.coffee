# Read more about app structure at http://docs.appgyver.com

module.exports =

  # See styling options for tabs and other native components in app/common/native-styles/ios.css or app/common/native-styles/android.css
  tabs: [
    {
      title: "Food"
      id: "food"
      location: "food#index" # URLs are supported!
    }
    {
      title: "Map"
      id: "map"
      location: "food#map" # Supersonic module#view type navigation
    }
  ]
  preloads: [
    {
      id: "map"
      location: "food#map"
    }
  ]
