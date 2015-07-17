/**
 * Created by fernandotapia on 7/16/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/office/', {
        controller: 'OfficeListController',
        templateUrl: 'app/views/office/index.gsp'
    }).when('/office/create', {
        controller: 'OfficeCreateController',
        templateUrl: 'app/views/office/create.gsp'
    }).when('/office/edit/:id', {
        controller: 'OfficeEditController',
        templateUrl: 'app/views/office/edit.gsp'
    }).when('/office/show/:id', {
        controller: 'OfficeShowController',
        templateUrl: 'app/views/office/show.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);