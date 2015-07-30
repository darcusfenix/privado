/**
 * Created by Tapia Mujica Fernando on 28/07/15
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/structure/', {

        controller: 'StructureListController',
        templateUrl: 'app/views/structure/index.gsp'

    }).when('/structure/create', {

        controller: 'StructureCreateController',
        templateUrl: 'app/views/structure/create.gsp'

    }).when('/structure/edit/:id', {
        controller: 'StructureEditController',
        templateUrl: 'app/views/structure/edit.gsp'

    }).when('/structure/show/:id', {
        controller: 'StructureShowController',
        templateUrl: 'app/views/structure/show.gsp'
    }).otherwise({

        redirectTo: '/'

    });
}]);