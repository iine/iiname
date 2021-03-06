app.controller("PlaceController",
              ["$http", "$location", "$scope", "$localStorage",
              function($http, $location, $scope, $localStorage) {
  var vm = this;
  vm.parent = $scope.$parent;
  // vm.prefectures = [];
  vm.places = [];

  vm.select = function(origin_adress) {
    delete $localStorage.places_keywords;
    $localStorage.places_keywords = {origin: origin_adress, places: vm.places};
  　$http.get("/suggestions/any.json", {params: { "places[]": _.sample(vm.places, 10)}}).then(function(res) {
      vm.parent.vm.keyword = {word: res.data.keyword, className: "places", origin: origin_adress};
      vm.parent.vm.last_suggestion = "places[]";
    });
  }

  var map;
  var infowindow;
  var markers = [];

  function initialize(lat,lng,create_only, name) {
    var city = new google.maps.LatLng(lat,lng);

    map = new google.maps.Map(document.getElementById('map'), {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: city,
        zoom: 14,
        disableDoubleClickZoom: true
    });

    google.maps.event.addListener(map, "dblclick", function(e) {
      markers.forEach(function(marker) {
        marker.setMap(null);
      })
      createMarker(e.latLng, e.latLng.toString());
      nearbySearch(map, e.latLng, e.latLng.lat() + "," + e.latLng.lng());
    });

    infowindow = new google.maps.InfoWindow();
    createMarker(city, name);
    if( create_only ){
      return;
    }

    nearbySearch(map, city, name);
  }

  function nearbySearch(map, location, origin_adress){
    var request = {
        location: location,
        radius: 1000  /* 指定した座標から半径1000m以内 */
    };
    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback.bind(this, origin_adress));
  }

  function callback(origin_adress, results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      vm.places = [];
      var j = 1;
      for (var i = 0; i < results.length; i++) {
        var spot = results[i];
        var types = spot.types;
        if( array_has("school", types)
        || array_has("train_station", types) ){
          continue;
        }
        // console.log(spot);
        // createMarker(spot.geometry.location, spot.name);
        vm.places.push(spot.name);
        // if( (array_has("establishment", types) && j==1) ||
        //   ((array_has("store",types) ||
        //     array_has("restaurant",types) ||
        //     array_has("shopping_mall",types) ||
        //     array_has("food",types) ||
        //     array_has("cafe",types) ||
        //     array_has("meal_takeaway",types)
        //    )
        //    && j==2) ){
        //   $(".place"+j).text(spot.name);
        //   createMarker(spot);
        //   j++;
        // }
        // if( j > 2 ){
        //   if( $(".place"+j).text() ){
        //     $(".place"+j).text(spot.name);
        //     createMarker(spot);
        //     j++;
        //   }
        // }
      }
      // if( j==1 ){
      //   $(".place1").text(results[0].name);
      //   createMarker(results[0]);
      //   $(".place2").text(results[1].name);
      //   createMarker(results[1]);
      // }
      // if( j==2 ){
      //   $(".place2").text(results[2].name);
      //   createMarker(results[5]);
      // }
      vm.select(origin_adress);
    }
  }

  function createMarker(location, name) {
    var marker = new google.maps.Marker({
        map: map,
        position: location,
        draggable: true
    });
    // マーカーをクリックすると場所の名前を表示
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(name);
        infowindow.open(map, this);
    });
    google.maps.event.addListener(marker, 'dragend', function(e) {
      nearbySearch(map, e.latLng, e.latLng.lat() + "," + e.latLng.lng());
    });
    markers.push(marker);
    return marker;
  }

  $(document).ready(function(){
    $("#search").click(findPlaces);
    $("#city_name").change(findPlaces);

    initialize(35.606938, 139.7489739, true, "AIIT");
  });

  function findPlaces(){
      // 入力された地名の緯度経度を得る
      var address = document.getElementById("city_name").value;
      if( !address ){
          alert("city not found");
          return;
      }
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({'address':address},  //住所文字列
      function(results,status){
        if (status == google.maps.GeocoderStatus.OK) {
          var loc = results[0].geometry.location;
          $(".place_name").text(address);
          initialize(loc.lat(), loc.lng(), false, address);
          // map.setCenter(results[0].geometry.location);  //入力された地域をmapの中心に表示
        }else {
          // 都市が見つからなければ、エラーのダイアログを出す
          alert("city not found: " + status);
        }
      }
      );
  }

  function array_has(target, items){
    for( var i=0; i<items.length; i++ ){
      if( target == items[i] ){
        return true;
      }
    }
    return false;
  }

}]);
