/**
 * Created by fernandotapia on 7/16/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/inductionClass/', {
        controller: 'InductionClassListController',
        templateUrl: 'app/views/inductionClass/index.gsp'
    }).when('/inductionClass/create', {
        controller: 'InductionClassCreateController',
        templateUrl: 'app/views/inductionClass/create.gsp'
    }).when('/inductionClass/edit/:id', {
        controller: 'InductionClassEditController',
        templateUrl: 'app/views/inductionClass/edit.gsp'
    }).when('/inductionClass/show/:id', {
        controller: 'InductionClassShowController',
        templateUrl: 'app/views/inductionClass/show.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]).filter('split', function () {
    return function (input, splitChar, splitIndex) {
        return input.split(splitChar)[splitIndex];
    }
});