/**
 * Created by alberto on 3/07/15.
 */
var app = angular.module('ControlEscuela', ['ngRoute', 'ngResource', 'angular-loading-bar']);
app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/', {
        controller: 'MainController',
        templateUrl: 'app/views/main/index.gsp'
    }).when('/user/', {
        controller: 'UserListController',
        templateUrl: 'app/views/user/index.gsp'
    }).when('/user/create', {
        controller: 'UserCreateController',
        templateUrl: 'app/views/user/create.gsp'
    }).when('/user/edit/:id', {
        controller: 'UserEditController',
        templateUrl: 'app/views/user/edit.gsp'
    }).when('/user/show/:id', {
        controller: 'UserShowController',
        templateUrl: 'app/views/user/show.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);

/*
 .when('/user/create', {
 controller: 'UserCreateController',
 templateUrl: 'views/user/index.gsp'
 }).when('/user/edit/:id', {
 controller: 'UserEditController',
 templateUrl: 'views/user/edit.gsp'
 }).when('/user/show/:id', {
 controller: 'UserShowController',
 templateUrl: 'views/user/show.gsp'
 })
* */