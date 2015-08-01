/**
 * Created by Tapia Mujica Fernando on 28/07/15
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/question/', {

        controller: 'QuestionListController',
        templateUrl: 'app/views/question/index.gsp'

    }).when('/question/create', {

        controller: 'QuestionCreateController',
        templateUrl: 'app/views/question/create.gsp'

    }).when('/question/edit/:id', {
        controller: 'QuestionEditController',
        templateUrl: 'app/views/question/edit.gsp'

    }).when('/question/show/:id', {
        controller: 'QuestionShowController',
        templateUrl: 'app/views/question/show.gsp'
    }).otherwise({

        redirectTo: '/'

    });
}]).directive('uploaderModel', ["$parse", function ($parse) {
    return {
        restrict: 'A',
        link: function (scope, iElement, iAttrs) {
            iElement.on("change", function (e) {
                $parse(iAttrs.uploaderModel).assign(scope, iElement[0].files[0]);
                scope.$apply();
            });
        }
    };
}]);