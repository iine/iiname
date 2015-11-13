app.controller("InterestsController", ["$http", "$location", "$scope", function($http, $location, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.inames = [];

  vm.ileft = function() {
    vm.inames.push("left");
    vm.get_suggestion();
  };

  vm.iright = function() {
    vm.inames.push("right");
    vm.get_suggestion();
  };

  vm.get_suggestion = function() {
    $http.get("/suggestions/any.json", {params: {"interests[]": vm.inames }}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
      $location.url("/names");
    });
  };
}]);
