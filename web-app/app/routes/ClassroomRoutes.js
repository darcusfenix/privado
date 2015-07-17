/**
 * Created by fernandotapia on 7/11/15.
 */
angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/classroom/', {
        controller: 'ClassroomListController',
        templateUrl: 'app/views/classroom/index.gsp'
    }).when('/classroom/create', {
        controller: 'ClassroomCreateController',
        templateUrl: 'app/views/classroom/create.gsp'
    }).when('/classroom/edit/:id', {
        controller: 'ClassroomEditController',
        templateUrl: 'app/views/classroom/edit.gsp'
    }).when('/classroom/show/:id', {
        controller: 'ClassroomShowController',
        templateUrl: 'app/views/classroom/show.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);
