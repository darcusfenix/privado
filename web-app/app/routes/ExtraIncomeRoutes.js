/**
 * Created by darcusfenix on 25/07/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/extraIncome/', {

        controller: 'ExtraIncomeListController',
        templateUrl: 'app/views/extraIncome/index.gsp'

    }).when('/extraIncome/create', {

        controller: 'ExtraIncomeCreateController',
        templateUrl: 'app/views/extraIncome/create.gsp'

    }).when('/extraIncome/edit/:id', {
        controller: 'ExtraIncomeEditController',
        templateUrl: 'app/views/extraIncome/edit.gsp'

    }).when('/extraIncome/show/:id', {
        controller: 'ExtraIncomeShowController',
        templateUrl: 'app/views/extraIncome/show.gsp'
    }).otherwise({

        redirectTo: '/'

    });
}]);