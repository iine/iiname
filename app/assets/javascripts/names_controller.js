app.controller("NamesController", ["$http", "$scope", function($http, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.names = [""];

  vm.push = function(e) {
    $http.get("/names/suggestion/", {params: {"names[]": vm.names}}).then(function(res) {
      vm.parent.vm.keyword = res.data.keyword;
    });
  }
  vm.add = function(e) {
    vm.names.push("");
  }
}]);