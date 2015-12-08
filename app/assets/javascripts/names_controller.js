app.controller("NamesController",
              ["$http", "$location", "$scope", "$localStorage",
              function($http, $location, $scope, $localStorage) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.names = [""];

  vm.push = function(e) {
    $("input[type=button]").attr("disabled", true);
    $localStorage.names_keywords = vm.names;
    $http.get("/suggestions/any.json", {params: {"names[]": vm.names}}).then(function(res) {
      vm.parent.vm.keyword = {word: res.data.keyword, className: "names", origin: vm.names[0]};
      vm.parent.vm.last_suggestion = "names[]";
      // $location.url("/place");
    }).finally(function(){
      $("input[type=button]").attr("disabled", false);
    });
  }
  vm.add = function(e) {
    vm.names.push("");
  }
}]);