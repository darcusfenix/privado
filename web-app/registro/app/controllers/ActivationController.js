/**
 * Created by alberto on 8/2/15.
 */
angular.module('Registro').controller('ActivationController', ['$scope', '$http','$location','$routeParams','$rootScope', function ($scope, $http, $location,$routeParams,$rootScope) {
    $rootScope.token = $routeParams.token || "";
    $scope.token = $routeParams.token;
    //
    console.log($routeParams.token);

    $scope.enrollmentInformation = {};

    $scope.classConfirmation = function classConfirmation(){

    };
    // Validating the user
    $http({
        method: 'GET',
        url: '/ControlEscuela/user/activate/',
        params: { token: $routeParams.token }
    }).success(function (data) {
        console.log(data);
        $scope.enrollmentInformation = data;
        $("#content").removeClass("ocultar");
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
        alert(data.message);
    });

}]);