/**
 * Created by darcusfenix on 28/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/section/', {

        controller: 'SectionListController',
        templateUrl: 'app/views/section/index.gsp'

    }).when('/section/create', {

        controller: 'SectionCreateController',
        templateUrl: 'app/views/section/create.gsp'

    }).when('/section/edit/:id', {

        controller: 'SectionEditController',
        templateUrl: 'app/views/section/edit.gsp'

    }).when('/section/show/:id', {

        controller: 'SectionShowController',
        templateUrl: 'app/views/section/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });

}]);