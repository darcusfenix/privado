/**
 * Created by alberto on 8/2/15.
 */
angular.module('Registro').controller('ScheduleIssueController', ['$scope', '$http', '$location', '$routeParams', '$rootScope', function ($scope, $http, $location, $routeParams, $rootScope) {
    $rootScope.token = $routeParams.token || "";
    $scope.token = $routeParams.token;
    //
    $scope.enrollmentInformation = {};
    $scope.appointmentDateSelect = -1;


    $scope.generateAppointment = function generateAppointment($event) {
        if ($scope.appointmentDateSelect != -1) {
            $event.preventDefault();
            console.log($scope.appointmentDateSelect);
            var date = new Date();
            date.setHours($scope.appointmentDateSelect.split(":")[0]);
            date.setMinutes($scope.appointmentDateSelect.split(":")[1]);
            console.log(date);
            console.log(date);
            console.log(date);
            console.log(date);
            $http({
                method: 'GET',
                url: '/ControlEscuela/user/generateAppointment/',
                params: {
                    token: $routeParams.token,
                    appointmentDate: date
                }
            }).success(function (data) {
                console.log(data);
                $location.path('/classConfirmation/' + $routeParams.token);
            }).error(function (data) {
                console.log(data);
                $scope.message = data.message;
                alert(data.message);
            });
        } else {
            alert("Debes seleccionar una clase de inducción");
        }
    };
    $("#content").removeClass("ocultar");
}]);