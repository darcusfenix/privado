/**
 * Created by fernandotapia on 7/18/15.
 */

function InductionClassListController($scope, InductionClass, $location, $rootScope) {
    $rootScope.location = $location.path();
    $scope.inductionClassList = InductionClass.query();
    $rootScope.nameSpace = 'Clase de inducción';

};

function InductionClassCreateController($scope, $location, $routeParams, $rootScope, InductionClass, $filter) {
    ComponentsPickers.init();
    $rootScope.location = $location.path();

    $scope.validatorFecha = {
        hasError: false,
        message: "El campo de fecha es requerido para agregar una clase de inducción."
    }

    $scope.inductionClassInstance = InductionClass.create(function (data) {
        $scope.inductionClassInstance = data;
    });
    $scope.saveInductionClass = function saveInductionClass(valid, $event) {
        $event.preventDefault();
        if ($(".dtime").val() == "") {
            $scope.validatorFecha.hasError = true;
        } else {
            $scope.validatorFecha.hasError = false;
            $scope.inductionClassInstance.date = $filter('date')($(".dtime").val(), 'dd/MM/yyyy - hh:mm:ss a')
            if (valid) {
                $scope.inductionClassInstance.$save(function (data) {
                    $scope.inductionClassInstance = data;
                    $rootScope.message = data.message;
                    $location.path("/inductionClass/");
                }, function (error) {
                    $scope.errors = error.data.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                });
            }
        }

    }

    $scope.cancelar = function cancelar() {
        $location.path("/inductionClass/");
    };
}