app.controller("MainController",
              ["$scope", "$http", "$interval", "$localStorage",
              function($scope, $http, $interval, $localStorage) {
  var vm = this;
  vm.list = [];
  vm.keyword = {word: "", origin: null};
  vm.params = {};
  vm.last_suggestion = "";
  vm.requestLock = false;
  $localStorage.$default({
    interests_keywords: [],
    places_keywords: [],
    names_keywords: []
  });

  $scope.$watch(function() {
    return vm.keyword;
  }, function(newVal, oldVal) {
    if (oldVal != null && oldVal.word != "") {
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
      "names[]": $localStorage.names_keywords,
    }
  });

  vm.get_suggestion = function() {
    if (!vm.requestLock) {
      vm.requestLock = true;
      var params = {};
      $.extend(true, params, vm.params); // deep copy
      var origin = null;
      if (vm.params["places[]"] != null) {
        params["places[]"] = _.sample(vm.params["places[]"]["places"], 10);
      }
      if (vm.last_suggestion != null) {
        params = _.pick(params, vm.last_suggestion);
        if (vm.last_suggestion == "places[]") {
          origin = vm.params["places[]"]["origin"];
        } else if (vm.last_suggestion == "interests"){
          origin = params["interests"]["url"];
          params["interests"] = params["interests"]["keyword"];
        } else {
          origin = _.flatten(_.values(params))[0];
        }
      } else {
        params = {};
      }
      $http.get("/suggestions/any.json", {params: params}).then(function(res){
        vm.keyword = {word: res.data.keyword, className: vm.last_suggestion.replace("[]", ""), origin: origin};
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
