/**
 * Created by darcusfenix on 16/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/type-course/', {

        controller: 'typeCourseListController',
        templateUrl: 'app/views/typeCourse/index.gsp'

    }).when('/type-course/create', {

        controller: 'typeCourseCreateController',
        templateUrl: 'app/views/typeCourse/create.gsp'

    }).when('/type-course/edit/:id', {

        controller: 'typeCourseEditController',
        templateUrl: 'app/views/typeCourse/edit.gsp'

    }).when('/type-course/show/:id', {

        controller: 'typeCourseShowController',
        templateUrl: 'app/views/typeCourse/show.gsp'

    }).otherwise({

        redirectTo: '/'

    });

}]);