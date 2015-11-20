app.controller("InterestsController",
               ["$http", "$location", "$scope", "$localStorage",
               function($http, $location, $scope, $localStorage) {
  var vm = this;
  vm.parent = $scope.$parent;
  // vm.inames = [];
  vm.images = [];

  vm.ileft = function() {
    var interests_keyword = vm.images[0].keyword;
    $localStorage.interests_keywords.push(interests_keyword);
    $http.get("/suggestions/any.json", {params: {"interests":  interests_keyword}}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
      // $location.url("/names");
    });
    $http.get("/images.json", {params: {count: 2}}).then(function(res) {
          vm.images = res.data;
    });
  };

  vm.iright = function() {
    var interests_keyword = vm.images[1].keyword;
    $localStorage.interests_keywords.push(interests_keyword);
    $http.get("/suggestions/any.json", {params: {"interests": interests_keyword }}).then(function(res){
      vm.parent.vm.keyword = res.data.keyword;
      // $location.url("/names");
    });
    $http.get("/images.json", {params: {count: 2}}).then(function(res) {
          vm.images = res.data;
    });
  };

  $http.get("/images.json", {params: {count: 2}}).then(function(res) {
        vm.images = res.data;
  });

}]);
