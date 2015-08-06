/**
 * Created by darcusfenix on 15/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/type-service/', {

        controller: 'typeServiceListController',
        templateUrl: 'app/views/typeService/index.gsp'

    }).when('/type-service/create', {

        controller: 'typeServiceCreateController',
        templateUrl: 'app/views/typeService/create.gsp'

    }).when('/type-service/edit/:id', {

        controller: 'typeServiceditController',
        templateUrl: 'app/views/typeService/edit.gsp'

    }).when('/type-service/show/:id', {

        controller: 'typeServiceShowController',
        templateUrl: 'app/views/typeService/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });

}]);