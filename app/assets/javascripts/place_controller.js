app.controller("PlaceController", ["$http", "$location", "$scope", function($http, $location, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.prefectures = [];

  vm.select = function(e) {
  　$http.get("/suggestions/any.json", {params: { prefecture_id: vm.prefecture_id}}).then(function(res) {
     vm.parent.vm.keyword = res.data.keyword;
     $location.url("/interests");
    });
  }

  var latlng = new google.maps.LatLng(35.66, 139.69);
  var options = {
      zoom: 15,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById('map'), options);

  $http.get("/prefectures.json").then(function(res) {
    vm.prefectures = res.data;
  });
}]);
