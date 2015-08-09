/**
 * Created by Fernando
 * TODO: Cambiar clases de inducción
 */
angular.module('Registro').controller('ScheduleIssueController', ['$scope', '$http', '$location', '$routeParams', '$rootScope', function ($scope, $http, $location, $routeParams, $rootScope) {
    $rootScope.token = $routeParams.token || "";
    $scope.token = $routeParams.token;
    //
    $scope.enrollmentInformation = {};
    $scope.appointmentDateSelect = -1;
    $scope.appointmentDate = -1;
    $scope.inductionDateSelect = -1;
    $scope.messageTime = null;


    var d = new Date()
    $http({
        method: 'GET',
        url: '/ControlEscuela/User/Dates'
    }).success(function (data) {
        d.setYear(data.year.split("-")[0])
        d.setMonth(data.mes)
        d.setDate(data.day)
        d.setHours(data.h)
        d.setMinutes(data.m)
    }).error(function (data) {
        $scope.message = data.message;
        alert(data.message);
    });


    var test = null
    var iC = "inductionClass"
    var app = "appointment"
    var dFinal = null;
    var iClass;

    var dSelect = new Date();
    if (d.getDate() == 9 && d.getHours() < 17) {
        $("#induccion").removeClass("hidden");
    } else {
        $("#citas").removeClass("hidden");
    }

    var b = false;
    $scope.generateAppointment = function generateAppointment($event) {
        $event.preventDefault();

        if (d.getDate() == 9 && d.getHours() < 17) {
            test = iC
            if ($scope.inductionDateSelect != -1) {
                dSelect.setHours($scope.inductionDateSelect.split(":")[0])
                dSelect.setMinutes($scope.inductionDateSelect.split(":")[1])
                if (d < dSelect) {
                    dFinal = $scope.inductionDateSelect;
                    if ($scope.inductionDateSelect.split(":")[0] == "11") {
                        iClass = 1;
                    } else if ($scope.inductionDateSelect.split(":")[0] == "13") {
                        iClass = 2;
                    } else if ($scope.inductionDateSelect.split(":")[0] == "16") {
                        iClass = 3;
                    } else {
                        iClass = 4;
                    }

                    $scope.messageTime = "";
                    b = true
                } else {
                    $scope.messageTime = "El horario seleccionado ha terminado, porfavor selecciona un horario mayor a tu hora actual";
                    b = false;
                }
            } else {
                $scope.messageTime = "El horario seleccionado es incorrecto";
                b = false;
            }
        } else {
            test = app
            if ($scope.appointmentDateSelect != -1) {
                dSelect.setHours($scope.appointmentDateSelect.split(":")[0])
                dSelect.setMinutes($scope.appointmentDateSelect.split(":")[1])
                if ($scope.appointmentDate == "1") {
                    if (d < dSelect) {
                        dFinal = $scope.appointmentDateSelect;
                        $scope.messageTime = "";
                        b = true
                    } else {
                        $scope.messageTime = "El horario seleccionado para la cita ha terminado, porfavor selecciona un horario mayor a tu hora actual";
                        b = false;
                    }
                } else {
                    dFinal = $scope.appointmentDateSelect;
                    $scope.messageTime = "";
                    b = true
                }

            } else {
                $scope.messageTime = "El horario seleccionado ha terminado, porfavor selecciona un horario mayor a tu hora actual";
                b = false;
            }
        }
        if (b) {
            $("#Continuar").attr("disabled", true);
            $scope.messageTime = "";
            $http({
                method: 'GET',
                url: '/ControlEscuela/user/generateAppointment/',
                params: {
                    token: $routeParams.token,
                    appointmentDate: dFinal,
                    test: test,
                    day: $scope.appointmentDate,
                    idClass: iClass
                }
            }).success(function (data) {
                $location.path('/classConfirmation/' + $routeParams.token);
            }).error(function (data) {
                $("#Continuar").attr("disabled", false);
                console.log(data);
                $scope.message = data.message;
                alert(data.message);
            });
        }
    };

    $("#content").removeClass("ocultar");
}
])
;