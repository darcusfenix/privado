/**
 * Created by darcusfenix on 17/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/mockExam/', {

        controller: 'MockExamListController',
        templateUrl: 'app/views/mockExam/index.gsp'

    }).when('/mockExam/create', {

        controller: 'MockExamCreateController',
        templateUrl: 'app/views/mockExam/create.gsp'

    }).when('/mockExam/edit/:id', {

        controller: 'MockExamEditController',
        templateUrl: 'app/views/mockExam/edit.gsp'

    }).when('/mockExam/show/:id', {

        controller: 'MockExamShowController',
        templateUrl: 'app/views/mockExam/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);