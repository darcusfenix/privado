/**
 * Created by alberto on 3/07/15.
 */
var app = angular.module('ControlEscuela', ['ngRoute', 'ngResource', 'angular-loading-bar']);
app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/', {
        controller: 'MainController',
        templateUrl: 'app/views/main/index.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);