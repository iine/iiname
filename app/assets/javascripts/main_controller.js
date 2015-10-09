app.controller("MainController", ["$scope", function($scope) {
  var vm = this;
  vm.list = [];
  vm.keyword = "";

  $scope.$watch(function() {
    return vm.keyword;
  }, function(newVal, oldVal) {
    vm.list.push(oldVal);
  }, true);

}]);