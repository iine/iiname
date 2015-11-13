app.controller("NamesController", ["$http", "$location", "$scope", function($http, $location, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.names = [""];

  vm.push = function(e) {
    $("input[type=button]").attr("disabled", true);
    $http.get("/names/suggestion/", {params: {"names[]": vm.names}}).then(function(res) {
      vm.parent.vm.keyword = res.data.keyword;
      $location.url("/place");
    }).finally(function(){
      $("input[type=button]").attr("disabled", false);
    });
  }
  vm.add = function(e) {
    vm.names.push("");
  }
}]);