/**
 * Created by darcusfenix on 7/15/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/service/', {
        controller: 'ServiceListController',
        templateUrl: 'app/views/service/index.gsp'
    }).when('/service/create', {
        controller: 'ServiceCreateController',
        templateUrl: 'app/views/service/create.gsp'
    }).when('/service/edit/:id', {
        controller: 'ServiceditController',
        templateUrl: 'app/views/service/edit.gsp'
    }).when('/service/show/:id', {
        controller: 'ServiceShowController',
        templateUrl: 'app/views/service/show.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);