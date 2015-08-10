/**
 * Created by darcusfenix on 7/11/15.
 */

angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/voucherPayment/create', {
        controller: 'VoucherPaymentCreatePerClassRoomController',
        templateUrl: 'app/views/voucherPayment/create.gsp'
    }).when('/voucherPayment/student/:id', {
        controller: 'VoucherPaymentShowStudentController',
        templateUrl: 'app/views/voucherPayment/show-student.gsp'
    }).when('/voucherPayment/student/:userId/service/:serviceId/record', {
        controller: 'VoucherPaymentShowStudentRecordController',
        templateUrl: 'app/views/voucherPayment/student-record.gsp'
    }).when('/voucherPayment/disableServices', {
        controller: 'VoucherPaymentDisableServicesController',
        templateUrl: 'app/views/voucherPayment/disableServices.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);
