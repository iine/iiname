app.config(["$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
  $routeProvider
  .when("/", {templateUrl: "partials/main.html"/*, controller: "MainController"*/})
  .when("/place", {templateUrl: "partials/place.html"/*, controller: "PlaceController"*/})
  .when("/interests", {templateUrl: "partials/interests.html"/*, controller: "InterestsController"*/})
  .when("/names", {templateUrl: "partials/names.html"/*, controller: "NamesController"*/})
  .otherwise({ redirectTo: "/"});
  $locationProvider.html5Mode(false);
}]);