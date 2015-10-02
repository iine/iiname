app.controller("MainController", ["$http", function($http) {
  var vm = this;
  $http.get("/suggestions/any.json").then(function(res){
    vm.keyword = res.data.keyword;
  });
}]);