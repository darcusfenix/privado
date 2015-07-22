/**
 * Created by darcusfenix on 20/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/extraService/', {

        controller: 'ExtraServiceListController',
        templateUrl: 'app/views/extraService/index.gsp'

    }).when('/extraService/create', {

        controller: 'ExtraServiceCreateController',
        templateUrl: 'app/views/extraService/create.gsp'

    }).when('/extraService/edit/:id', {

        controller: 'ExtraServiceEditController',
        templateUrl: 'app/views/extraService/edit.gsp'

    }).when('/extraService/show/:id', {

        controller: 'ExtraServiceShowController',
        templateUrl: 'app/views/extraService/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);