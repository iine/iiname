app.controller("MainController",
              ["$scope", "$http", "$interval", "$localStorage",
              function($scope, $http, $interval, $localStorage) {
  var vm = this;
  vm.list = [];
  vm.keyword = "";
  vm.params = {};
  vm.last_suggestion = null;
  vm.requestLock = false;
  $localStorage.$default({
    interests_keywords: [],
    places_keywords: []
  });

  $scope.$watch(function() {
    return vm.keyword;
  }, function(newVal, oldVal) {
    if (oldVal != null && oldVal != "") {
      vm.list.push(oldVal);
    }
  }, true);

  // localStorageをwatch
  $scope.$watch(function() {
    return angular.toJson($localStorage.valueOf());
  }, function(newVal, oldVal) {
    vm.params = {
      interests: $localStorage.interests_keywords[($localStorage.interests_keywords.length - 1)],
      "places[]": $localStorage.places_keywords,
    }
  });

  vm.get_suggestion = function() {
    if (!vm.requestLock) {
      vm.requestLock = true;
      var params = vm.params;
      params["places[]"] = _.sample(vm.params["places[]"], 10);
      if (vm.last_suggestion != null) {
        params = _.pick(params, vm.last_suggestion);
      }
      $http.get("/suggestions/any.json", {params: params}).then(function(res){
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
