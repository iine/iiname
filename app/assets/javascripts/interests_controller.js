app.controller("InterestsController",
               ["$http", "$location", "$scope", "$localStorage",
               function($http, $location, $scope, $localStorage) {
  var vm = this;
  vm.parent = $scope.$parent;
  // vm.inames = [];
  vm.images = [];

  vm.ileft = function() {
    var interests_keyword = vm.images[0].keyword;
    $localStorage.interests_keywords.push({keyword: interests_keyword, url: vm.images[0].url});
    $http.get("/suggestions/any.json", {params: {"interests":  interests_keyword}}).then(function(res){
      vm.parent.vm.keyword = {word: res.data.keyword, className: "interests", origin: vm.images[0].url};
      vm.parent.vm.last_suggestion = "interests";
      // $location.url("/names");
    });
    $http.get("/images.json", {params: {count: 2}}).then(function(res) {
          vm.images = res.data;
    });
  };

  vm.iright = function() {
    var interests_keyword = vm.images[1].keyword;
    $localStorage.interests_keywords.push({keyword: interests_keyword, url: vm.images[1].url});
    $http.get("/suggestions/any.json", {params: {"interests": interests_keyword }}).then(function(res){
      vm.parent.vm.keyword = {word: res.data.keyword, className: "interests", origin: vm.images[1].url};
      vm.parent.vm.last_suggestion = "interests";
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
