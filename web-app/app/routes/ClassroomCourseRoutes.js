/**
 * Created by darcusfenix on 17/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/classroomCourse/', {

        controller: 'ClassroomCourseListController',
        templateUrl: 'app/views/classroomCourse/index.gsp'

    }).when('/classroomCourse/create', {

        controller: 'ClassroomCourseCreateController',
        templateUrl: 'app/views/classroomCourse/create.gsp'

    }).when('/classroomCourse/edit/:id', {

        controller: 'ClassroomCourseEditController',
        templateUrl: 'app/views/classroomCourse/edit.gsp'

    }).when('/classroomCourse/show/:id', {

        controller: 'ClassroomCourseShowController',
        templateUrl: 'app/views/classroomCourse/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);