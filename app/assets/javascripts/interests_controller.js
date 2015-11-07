app.controller("InterestsController", ["$http", "$location", "$scope", function($http, $location, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  // vm.inames = [];
  vm.images = [];

  vm.ileft = function() {
    $http.get("/suggestions/any.json", {params: {"interests": vm.images[0].keyword }}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
    });
  };

  vm.icenter = function() {
    $http.get("/suggestions/any.json", {params: {"interests": vm.images[1].keyword }}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
    });
  }

  vm.iright = function() {
    $http.get("/suggestions/any.json", {params: {"interests": vm.images[2].keyword }}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
      $location.url("/names");
    });
  };

  $http.get("/images.json", {params: {count: 4}}).then(function(res) {
        vm.images = res.data;
    });

}]);
