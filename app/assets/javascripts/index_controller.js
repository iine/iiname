app.controller("IndexController", ["$scope", "$http", function($scope, $http) {
  var vm = this;
  vm.parent = $scope.$parent;

  vm.get_suggestion = function() {
    $http.get("/suggestions/any.json").then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
    }).finally(function(){
    });
  };

  vm.retry = function(e) {
    vm.get_suggestion();
  };

  vm.get_suggestion();
}]);