app.controller("InterestsController", ["$http", "$scope", function($http, $scope) {
  var vm = this;
  vm.parent = $scope.$parent;
  vm.inames = [];

  vm.ileft = function() {
    // var results = ['Sea', 'Beach', 'Wave',];
    // var result = Math.floor(Math.random() * results.length);
    // document.getElementById('highest_suggestion').innerHTML = results[result];
    vm.inames.push("left");
    vm.get_suggestion();
  };

  vm.iright = function() {
    // var results = ['Mountain', 'Green', 'Forest',];
    // var result = Math.floor(Math.random() * results.length);
    // document.getElementById('highest_suggestion').innerHTML = results[result];
    vm.inames.push("right");
    vm.get_suggestion();
  };

  vm.get_suggestion = function() {
    $http.get("/suggestions/any.json", {params: {"interests[]": vm.inames }}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
    });
  };
}]);
