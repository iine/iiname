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

    $http.get("/prefectures.json").then(function(res) {
      vm.prefectures = res.data;
    });
}]);
