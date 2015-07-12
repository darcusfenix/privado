/**
 * Created by darcusfenix on 8/07/15.
 */



function VoucherPaymentCreateController($scope, $location, VoucherPayment, User, $rootScope, StudentService, Service, TypeService) {

    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};

    $scope.users = User.query();

    //$scope.services = Service.query();
    //$scope.typeServices= TypeService.query();

    $scope.voucherPaymentInstance = VoucherPayment.create();

    $scope.userSelected = {};

    $scope.servicesWithStudent = function (){
        $scope.studentServices = StudentService.services({userId:$scope.userSelected.id},function(data) {
            $scope.studentServices = data;
            console.log($scope.studentServices);
        });
    }

    $scope.saveVoucherPayment = function saveVoucherPayment() {
        console.log($scope.voucherPaymentInstance);
        $scope.voucherPaymentInstance = $scope.voucherPaymentInstance.$save(function savedVoucherPayment(data) {
            console.log(data);
            //console.log("Se guardó el nuevo método de pago con el id" + data.id);
            //$location.path("/voucherPayment/show/" + data.id);
        });

    };

    $scope.cancelar = function cancelar() {
        console.log("Se debe cambiar de vist");
        //$location.path("/voucherPayment/");
    };

};
