app.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when("/", {templateUrl: "partials/main.html", controller: "MainController"})
  .when("/sample", {templateUrl: "partials/sample.html", controller: "SampleController"})
  .otherwise({ redirectTo: "/"});

  $locationProvider.html5Mode(false);
});