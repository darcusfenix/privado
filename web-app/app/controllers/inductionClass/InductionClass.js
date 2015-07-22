/**
 * Created by fernandotapia on 7/18/15.
 */

function InductionClassListController($scope, InductionClass, $location, $rootScope) {
    $('#divSpinner').removeClass('hidden');
    $rootScope.location = $location.path();
    $scope.inductionClassList = InductionClass.query(function(){
        $('#divSpinner').addClass('hidden');
    });
    $rootScope.nameSpace = 'Clase de inducción';

};

function InductionClassCreateController($scope, $location, $routeParams, $rootScope, InductionClass, $filter, Office) {
    ComponentsPickers.init();
    $rootScope.location = $location.path();

    $scope.varSlc = 0;
    $scope.officeList = Office.query()

    $scope.validatorFecha = {
        hasError: false,
        message: "El campo de fecha es requerido para agregar una clase de inducción."
    }

    $scope.inductionClassInstance = InductionClass.create(function (data) {
        $scope.inductionClassInstance = data;
    });
    $scope.saveInductionClass = function saveInductionClass(valid, $event) {
        $('#divSpinner').removeClass('hidden');
        $event.preventDefault();
        if ($(".dtime").val() == "") {
            $scope.validatorFecha.hasError = true;
        } else {
            $scope.validatorFecha.hasError = false;
            $scope.inductionClassInstance.date = $filter('date')($(".dtime").val(), 'dd/MM/yyyy - hh:mm:ss a')
            if (valid) {
                $scope.inductionClassInstance.$save({idOffice: $scope.varSlc}, function (data) {
                    $scope.inductionClassInstance = data;
                    $rootScope.message = data.message;
                    $location.path("/inductionClass/");
                    $('#divSpinner').addClass('hidden');
                }, function (error) {
                    $scope.errors = error.data.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                    $('#divSpinner').addClass('hidden');
                });
            }
        }

    }

    $scope.cancelar = function cancelar() {
        $location.path("/inductionClass/");
    };
}

function InductionClassShowController($scope, $location, $routeParams, $rootScope, InductionClass) {
    UIGeneral.init();
    $rootScope.location = $location.path();

    $('#divSpinner').removeClass('hidden');

    $scope.inductionClassInstance = InductionClass.get({id: $routeParams.id}, function (data) {
        $('#divSpinner').addClass('hidden');
        $scope.inductionInstance = data;
    });

    $scope.editInductionClass = function editInductionOffice() {
        $location.path('/inductionClass/edit/' + $routeParams.id);
    };

    $scope.deleteInductionClass = function deleteInductionClass() {
        $scope.inductionClassInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/inductionClass/');
        }, function (error) {
            $scope.messageInductionClass = error.data.message;
        });
    };

    $scope.showStudent = function(id){
        $('#model-user').modal('hide');
        $location.path('/user/show/'+id);
    }

}

function InductionClassEditController($scope, $location, $routeParams, $rootScope, InductionClass, $filter, Office) {

    ComponentsPickers.init();
    $rootScope.location = $location.path();

    $scope.officeList = Office.query()

    $scope.validatorFecha = {
        hasError: false,
        message: "El campo de fecha es requerido para agregar una clase de inducción."
    }

    $scope.inductionClassInstance = InductionClass.get({id: $routeParams.id}, function (data) {
        $scope.inductionClassInstance = data;
        $(".dtime").val($filter('date')(data.date , 'dd MMMM yyyy - hh:mm a'))
        $scope.varSlc = $scope.inductionClassInstance.office.id;
    });

    $scope.updateInductionClass = function updateInductionClass(valid, $event) {
        $('#divSpinner').removeClass('hidden');

        $event.preventDefault();
        if ($(".dtime").val() == "") {
            $scope.validatorFecha.hasError = true;
        } else {
            $scope.validatorFecha.hasError = false;
            $scope.inductionClassInstance.date = $filter('date')($(".dtime").val(), 'dd/MM/yyyy - hh:mm:ss a')
            if (valid) {
                $scope.inductionClassInstance.$update({idOffice: $scope.varSlc}, function (data) {
                    $scope.inductionClassInstance = data;
                    $rootScope.message = data.message;
                    $location.path("/inductionClass/");
                    $('#divSpinner').addClass('hidden');
                }, function (error) {
                    $scope.errors = error.data.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                    $('#divSpinner').addClass('hidden');
                });
            }
        }

    }

    $scope.cancelar = function cancelar() {
        $location.path("/inductionClass/");
    };
}