app.controller("MainController", ["$scope", "$http", "$interval", function($scope, $http, $interval) {
  var vm = this;
  vm.list = [];
  vm.keyword = "";
  vm.params = {};
  vm.requestLock = false;

  $scope.$watch(function() {
    return vm.keyword;
  }, function(newVal, oldVal) {
    vm.list.push(oldVal);
  }, true);

  vm.get_suggestion = function() {
    if (!vm.requestLock) {
      vm.requestLock = true;
      $http.get("/suggestions/any.json", {params: vm.params}).then(function(res){
        vm.keyword = res.data.keyword;
      }).finally(function(){
        vm.requestLock = false;
      });
    }
  };

  vm.retryInterval = function() {
    console.log("retry interval");
    if (angular.isDefined(vm.stopPromise)) $interval.cancel(vm.stopPromise);
    vm.get_suggestion();
    vm.stopPromise = $interval(function(){
      vm.get_suggestion();
    }, 10000);
  };
  vm.retryInterval();

}]);