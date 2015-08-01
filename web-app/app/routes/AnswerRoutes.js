/**
 * Created by darcusfenix on 30/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/answer/', {

        controller: 'AnswerListController',
        templateUrl: 'app/views/answer/index.gsp'

    }).when('/answer/create', {

        controller: 'AnswerCreateController',
        templateUrl: 'app/views/answer/create.gsp'

    }).when('/answer/edit/:id', {

        controller: 'AnswerEditController',
        templateUrl: 'app/views/answer/edit.gsp'

    }).when('/answer/show/:id', {

        controller: 'AnswerShowController',
        templateUrl: 'app/views/answer/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);