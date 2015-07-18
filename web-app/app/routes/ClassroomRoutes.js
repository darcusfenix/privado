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

    }).when('/classrrom/edit/:id', {

        controller: 'UserEditController',
        templateUrl: 'app/views/classroom/edit.gsp'

    }).when('/classroom/show/:id', {

        controller: 'UserShowController',
        templateUrl: 'app/views/classrrom/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);
