/**
 * Created by Tapia Mujica Fernando on 27/07/15.
 */

function StructureListController($scope, $location, $rootScope, $filter, Structure) {

    $rootScope.nameSpace = 'Examen simulacro';
    $rootScope.location = $location.path();
    $scope.structureList = Structure.query();

};

function StructureCreateController($scope, $location, $rootScope, Structure, MockExam) {
    $rootScope.location = $location.path();
    $scope.validator = {};
    $scope.varSlc = 0;

    $scope.mockExamListList = MockExam.query(function (data) {
        $scope.mockExamListList = data;
        for (var i = 0; i < $scope.mockExamListList.length; i++) {
            if ($scope.mockExamListList[i].active === false || $scope.mockExamListList[i].active.length === 0) {
                $scope.mockExamListList.splice(i, 1);
            }
        }
    });

    $scope.structureInstance = Structure.create();

    $scope.saveMockExam = function saveMockExam(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.structureInstance.mockExam = $scope.varSlc;
            $scope.structureInstance.$save(
                function (data) {
                    $location.path("/structure/");
                    $rootScope.message = data.message;
                }, function (err) {
                    if (err.data.idError == 1) {
                        $scope.errorName = {
                            message: err.data.message,
                            estatus: true
                        };
                        $('.modal').modal('toggle');
                    }
                    if (err.data.errors) {
                        $scope.errors = err.data.errors;
                        for (var i = 0; i < $scope.errors.length; i++) {
                            $scope.validator[$scope.errors[i].field] = {
                                hasError: true,
                                message: $scope.errors[i].message
                            }

                        }
                    }
                    if (err.data.error) {
                        $rootScope.message = err.data.error;
                    }

                });
            return false;
        } else {
            return false;
        }
    };
};


function StructureEditController($scope, $location, $rootScope, Structure, $routeParams, MockExam) {
    $rootScope.location = $location.path();
    $('#divSpinner').removeClass('hidden');
    $scope.validator = {};
    $scope.varSlc = 0;

    $scope.mockExamListList = MockExam.query(function (data) {
        $scope.mockExamListList = data;
        for (var i = 0; i < $scope.mockExamListList.length; i++) {
            if ($scope.mockExamListList[i].active === false || $scope.mockExamListList[i].active.length === 0) {
                $scope.mockExamListList.splice(i, 1);
            }
        }
    });

    $scope.structureInstance = Structure.get({id: $routeParams.id}, function (data) {
        $('#divSpinner').addClass('hidden');
        $scope.structureInstance = data;
        $scope.varSlc = data.mockExam.id;
    });

    $scope.updateMockExam = function updateMockExam(valid, $event) {
        $('#divSpinner').removeClass('hidden');

        $event.preventDefault();
        if (valid) {
            $scope.structureInstance.$update(function (data) {
                $scope.structureInstance = data;
                $rootScope.message = data.message;
                $location.path("/structure/");
                $('#divSpinner').addClass('hidden');
            }, function (error) {
                if (error.data.idError == 1) {
                    $scope.errorName = {
                        message: error.data.message,
                        estatus: true
                    };
                    $('#divSpinner').addClass('hidden');
                    $('.modal').modal('toggle');
                }
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

};

function StructureShowController($scope, $location, $rootScope, Structure, $routeParams) {
    $rootScope.location = $location.path();
    $('#divSpinner').removeClass('hidden');

    $scope.structureInstance = Structure.get({id: $routeParams.id}, function (data) {
        $('#divSpinner').addClass('hidden');
        $scope.structureInstance = data;
    });

    $scope.editStructure = function editStructure() {
        $location.path('/structure/edit/' + $routeParams.id);
    };

    $scope.deleteStructure = function deleteStructure() {
        $scope.structureInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/structure/');
        }, function (error) {
            $scope.messageStructure = error.data.message;
        });
    };

};