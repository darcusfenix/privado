/**
 * Created by fernandotapia on 7/16/15.
 */

function OfficeListController($scope, Office, $location, $rootScope) {
    $rootScope.location = $location.path();
    $rootScope.nameSpace = 'Sucursales';
    $scope.officeList = Office.query();
}

function OfficeShowController($scope, $location, $routeParams, $rootScope, Office, Classroom) {
    $rootScope.nameSpace = 'Sucursales';
    $rootScope.location = $location.path();
    $scope.officeInstance = Office.get({id: $routeParams.id}, function (data) {
        $scope.officeInstance = data;
        $scope.classroomByOffice = Classroom.getClassroomByOffice({id: $scope.officeInstance.id});
    });

    $scope.editOffice = function editOffice() {
        $location.path('/office/edit/' + $routeParams.id);
    };

    $scope.deleteOffice = function deleteOffice() {
        $scope.officeInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/office/');
        }, function (error) {
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
        $event.preventDefault();
        if (valid) {
            $scope.officeInstance.$save(function (data) {
                $scope.officeInstance = data;
                $rootScope.message = data.message;
                $location.path("/office/");
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
        $event.preventDefault();
        if (valid) {
            $scope.officeInstance.$update(function (data) {
                $scope.officeInstance = data;
                $rootScope.message = data.message;
                $location.path("/office/");
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

    $scope.cancelar = function cancelar() {
        $location.path("/office/");
    };
}
