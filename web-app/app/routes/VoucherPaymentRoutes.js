/**
 * Created by darcusfenix on 7/11/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/voucherPayment/create', {
        controller: 'VoucherPaymentCreateController',
        templateUrl: 'app/views/voucherPayment/create.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);
