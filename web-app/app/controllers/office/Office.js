/**
 * Created by fernandotapia on 7/16/15.
 */

function OfficeListController($scope, Office, $location, $rootScope) {
    $('#divSpinner').removeClass('hidden');
    $rootScope.location = $location.path();
    $rootScope.nameSpace = 'Sucursales';
    $scope.officeList = Office.query(function(){
        $('#divSpinner').addClass('hidden');
    });
}

function OfficeShowController($scope, $location, $routeParams, $rootScope, Office, Classroom, InductionClass) {
    $('#divSpinner').removeClass('hidden');
    $rootScope.nameSpace = 'Sucursales';
    $rootScope.location = $location.path();
    $scope.officeInstance = Office.get({id: $routeParams.id}, function (data) {
        $scope.officeInstance = data;
        $scope.classroomByOffice = Classroom.getClassroomByOffice({id: $scope.officeInstance.id});
        $scope.inductionClassByOffice = InductionClass.getInductionClassByOffice({id: $scope.officeInstance.id});
        $('#divSpinner').addClass('hidden');
    });

    $scope.editOffice = function editOffice() {
        $location.path('/office/edit/' + $routeParams.id);
    };

    $scope.deleteOffice = function deleteOffice() {
        $('#divSpinner').removeClass('hidden');
        $scope.officeInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/office/');
            $('#divSpinner').addClass('hidden');
        }, function (error) {
            $('#divSpinner').addClass('hidden');
            $scope.messageOfficeClass = error.data.message;
        });
    };
}

function OfficeCreateController($scope, $location, $routeParams, $rootScope, Office) {
    $rootScope.nameSpace = 'Sucursales';
    $rootScope.location = $location.path();
    $scope.officeInstance = Office.create(function (data) {
        $scope.officeInstance = data;
    });
    $scope.saveOffice = function saveOffice(valid, $event) {
        $('#divSpinner').removeClass('hidden');
        $event.preventDefault();
        if (valid) {
            $scope.officeInstance.$save(function (data) {
                $scope.officeInstance = data;
                $rootScope.message = data.message;
                $location.path("/office/");
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

    $scope.cancelar = function cancelar() {
        $location.path("/office/");
    };
}

function OfficeEditController($scope, $location, $routeParams, $rootScope, Office) {
    $rootScope.nameSpace = 'Sucursales';
    $rootScope.location = $location.path();

    $scope.officeInstance = Office.get({id: $routeParams.id}, function (data) {
        $scope.officeInstance = data;
    });

    $scope.updateOffice = function updateOffice(valid, $event) {
        $('#divSpinner').removeClass('hidden');
        $event.preventDefault();
        if (valid) {
            $scope.officeInstance.$update(function (data) {
                $scope.officeInstance = data;
                $rootScope.message = data.message;
                $location.path("/office/");
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

    $scope.cancelar = function cancelar() {
        $location.path("/office/");
    };
}
