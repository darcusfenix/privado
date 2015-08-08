/**
 * Created by alberto on 24/07/15.
 */
angular.module('Registro').controller('RegistroController', ['$scope', '$http', '$location', '$filter', function ($scope, $http, $location, $filter) {
    $scope.userInstance = {};
    $scope.message = "";
    $scope.error = false;
    $scope.groups = [];

    $scope.vHorario = function (classes) {
        $scope.clazz = classes;
        $("#modal-1").addClass("md-show");
    }

    $scope.close = function () {
        $("#modal-1").removeClass("md-show");
    }

    $scope.registrar = function Registrar() {
        if ($scope.myform.$valid) {

            $("#confirm").attr("disabled", "disabled")

            $scope.userInstance.state = $(".cs-placeholder").text();

            //TODO Change it!

            $http.post('/ControlEscuela/user/enroll',

                $scope.userInstance
            ).success(function (data) {

                    $location.path("/correo/");

                }).error(function (data) {

                    $scope.error = true;
                    $scope.messageError = data.message;
                    $("#confirm").prop("disabled", false);
                    //$location.path("/correo/");

                });
        }
    };


    $http({
        method: 'GET',
        url: '/ControlEscuela/Classroom/'
    }).success(function (data) {
        // Filtering the groups according to the dates and restrictions!
        var currentGroups = data;
        var j = 1;
        var cambio = false;
        for (var i = 0; i < currentGroups.length; i++) {
            if (j != currentGroups[i].priority && $scope.groups.length != 0) {
                break;
            } else {
                j = currentGroups[i].priority;
            }
            if (currentGroups[i].places > 0 && currentGroups[i].priority == 1) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 2) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 3) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 4) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 5) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 6) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 7) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 8) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 9) {
                $scope.groups.push(currentGroups[i]);
                continue;
            } else if (currentGroups[i].places > 0 && currentGroups[i].priority == 10) {
                $scope.groups.push(currentGroups[i]);
                continue;
            }

        }
        $("#content").addClass("container");
        $("#content").removeClass("ocultar");
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
        alert(data.message);
    });

}]);