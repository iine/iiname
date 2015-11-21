app.controller("PlaceController",
              ["$http", "$location", "$scope", "$localStorage",
              function($http, $location, $scope, $localStorage) {
  var vm = this;
  vm.parent = $scope.$parent;
  // vm.prefectures = [];
  vm.places = [];

  vm.select = function(e) {
    delete $localStorage.places_keywords;
    var places = _.sample(vm.places, 10);
    $localStorage.places_keywords = places;
  　$http.get("/suggestions/any.json", {params: { "places[]": places}}).then(function(res) {
     vm.parent.vm.keyword = res.data.keyword;
     // $location.url("/interests");
    });
  }

  // $http.get("/prefectures.json").then(function(res) {
  //   vm.prefectures = res.data;
  // });

  var map;
  var infowindow;

  function initialize(lat,lng,create_only) {
    var city = new google.maps.LatLng(lat,lng);

    map = new google.maps.Map(document.getElementById('map'), {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: city,
        zoom: 14
    });

    if( create_only ){
      return;
    }

    var request = {
        location: city,
        radius: 1000  /* 指定した座標から半径1000m以内 */
    };
    infowindow = new google.maps.InfoWindow();
    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);
  }

  function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      var j = 1;
      for (var i = 0; i < results.length; i++) {
        var spot = results[i];
        var types = spot.types;
        if( array_has("school", types)
        || array_has("train_station", types) ){
          continue;
        }
        // console.log(spot);
        createMarker(spot);
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
      vm.select();
    }
  }

  function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
    });
//  マーカーをクリックすると場所の名前を表示
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
    });
  }

//google.maps.event.addDomListener(window, 'load', initialize);

  $(document).ready(function(){
    $("#search").click(findPlaces);
    $("#city_name").change(findPlaces);

    initialize(35.606938, 139.7489739, true);
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
          initialize(loc.lat(), loc.lng());
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
