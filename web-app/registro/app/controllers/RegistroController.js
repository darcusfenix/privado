/**
 * Created by alberto on 24/07/15.
 */
angular.module('Registro').controller('RegistroController', ['$scope', '$http','$location', function ($scope, $http, $location) {
    $scope.userInstance = {};
    $scope.message = "";
    $scope.error = false;
    $scope.registrar = function Registrar() {
        console.log($scope.userInstance);
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
}]);