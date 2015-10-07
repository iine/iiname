app.controller("NamesController", ["$http", function($http) {
  var vm = this;
  vm.names = [""];

  vm.push = function(e) {
    console.log(this.names);
    // $http.get("/").then(function(res) {
    //   console.log(res);
    // });
  }
  vm.add = function(e) {
    vm.names.push("");
  }
}]);