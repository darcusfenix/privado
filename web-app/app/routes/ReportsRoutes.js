/**
 * Created by darcusfenix on 9/08/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/reports/', {
        controller: 'getStudentsServicesPaidController',
        templateUrl: 'app/views/reports/index.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);