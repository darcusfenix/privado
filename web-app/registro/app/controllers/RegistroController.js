/**
 * Created by alberto on 24/07/15.
 */
angular.module('Registro').controller('RegistroController', ['$scope', '$http', '$location', function ($scope, $http, $location) {
    $scope.userInstance = {};
    $scope.message = "";
    $scope.error = false;
    $scope.groups = [];
    $scope.registrar = function Registrar() {
        //TODO Change it!
        $http.post('/ControlEscuela/user/enroll',
            $scope.userInstance
        ).success(function (data) {
                $location.path("/correo/");
            }).error(function (data) {
                $scope.error = true;
                $location.path("/correo/");
            });

    };


    $http({
        method: 'GET',
        url: '/ControlEscuela/Classroom/'
    }).success(function (data) {
        // Filtering the groups according to the dates and restrictions!
        var currentDate = new Date();
        var currentGroups = data;
        for (var i = 0; i < currentGroups.length; i++) {
            if (currentDate.getDate() <= 9) { // Saturday/sunday
                if (currentGroups[i].places > 0 && currentGroups[i].priority <= 2) {
                    $scope.groups.push(currentGroups[i]);
                    continue;
                }
            }
            if (currentDate.getDate() == 10) { // Saturday/sunday
                if (currentGroups[i].places > 0 && currentGroups[i].priority == 3) {
                    $scope.groups.push(currentGroups[i]);
                    continue;
                }
            }
            if (currentDate.getDate() >= 10) { // Saturday/sunday
                if (currentGroups[i].places > 0 && currentGroups[i].priority == 4) {
                    $scope.groups.push(currentGroups[i]);
                    continue;
                }
            }
        }
        console.log(currentGroups);
        console.log($scope.groups);
        console.log(currentDate);
        console.log(currentDate.getDate());
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
        alert(data.message);
    });
}]);