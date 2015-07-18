/**
 * Created by darcusfenix on 17/07/15.
 */


angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/onlineCourse/', {

        controller: 'OnlineCourseListController',
        templateUrl: 'app/views/onlineCourse/index.gsp'

    }).when('/onlineCourse/create', {

        controller: 'OnlineCourseCreateController',
        templateUrl: 'app/views/onlineCourse/create.gsp'

    }).when('/onlineCourse/edit/:id', {

        controller: 'OnlineCourseEditController',
        templateUrl: 'app/views/onlineCourse/edit.gsp'

    }).when('/onlineCourse/show/:id', {

        controller: 'OnlineCourseShowController',
        templateUrl: 'app/views/onlineCourse/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);