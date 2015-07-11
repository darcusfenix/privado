/**
 * Created by darcusfenix on 8/07/15.
 */


function VoucherPaymentCreateController($scope, $location, VoucherPayment, $rootScope) {

    $rootScope.location = $location.path();

    $scope.errors = [];
    $scope.voucherPaymentInstance = VoucherPayment.create();

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
