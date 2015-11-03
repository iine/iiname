app.controller("MainController", ["$scope", "$http", function($scope, $http) {
  var vm = this;
  vm.list = [];
  vm.keyword = "";

  $scope.$watch(function() {
    return vm.keyword;
  }, function(newVal, oldVal) {
    vm.list.push(oldVal);
  }, true);

  vm.get_suggestion = function() {
    $http.get("/suggestions/any.json").then(function(res){
      vm.keyword = res.data.keyword;
    }).finally(function(){
    });
  };

  vm.get_suggestion();

}]);