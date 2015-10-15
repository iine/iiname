app.controller("InterestsController", ["$http", "$scope", function($http, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.inames = [""];

  vm.ileft = function() {
    var results = ['Sea', 'Beach', 'Wave',];
    var result = Math.floor(Math.random() * results.length);
    document.getElementById('highest_suggestion').innerHTML = results[result];
  };

  vm.iright = function() {
    var results = ['Mountain', 'Green', 'Forest',];
    var result = Math.floor(Math.random() * results.length);
    document.getElementById('highest_suggestion').innerHTML = results[result];
  };

}]);
