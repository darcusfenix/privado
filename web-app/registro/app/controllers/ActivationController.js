/**
 * Created by alberto on 8/2/15.
 */
angular.module('Registro').controller('ActivationController', ['$scope', '$http','$location','$routeParams','$rootScope', function ($scope, $http, $location,$routeParams,$rootScope) {
    $rootScope.token = $routeParams.token || "";
    //
    $http({
        method: 'POST',
        url: '/ControlEscuela/user/activate',
        data: { token: $routeParams.token }
    }).success(function (data) {
        console.log(data);
        $scope.enrollmentInformation = data;
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
        alert(data.message);
    });

    $scope.enrollmentInformation = {};

    $scope.classConfirmation = function classConfirmation(){

    };

}]);