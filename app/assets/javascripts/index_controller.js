app.controller("IndexController", ["$scope", "$location", "$http", function($scope, $location, $http) {
  var vm = this;
  vm.parent = $scope.$parent;
  $location.url("/place");
}]);
