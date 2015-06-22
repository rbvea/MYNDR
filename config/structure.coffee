# Read more about app structure at http://docs.appgyver.com

module.exports =

  # See styling options for tabs and other native components in app/common/native-styles/ios.css or app/common/native-styles/android.css
  tabs: [
    {
      title: "Feed"
      id: "food"
      location: "food#index" # URLs are supported!
    }
    {
      title: "Map"
      id: "map"
      location: "food#map" # Supersonic module#view type navigation
    }
    {
      title: "Favorites"
      id: "favorites"
      location: "food#favorites" # Supersonic module#view type navigation
    }
    {
      title: "Capture"
      id: "capture"
      location: "food#capture" # Supersonic module#view type navigation
    }
  ]
