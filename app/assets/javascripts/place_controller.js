app.controller("PlaceController", ["$http", "$scope", function($http, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.prefectures = [];

  vm.select = function(e) {
     console.info(vm.prefecture_id);
  }

 $http.get("/prefectures.json").then(function(res) {
     vm.prefectures = res.data;
  });
    
}]);
