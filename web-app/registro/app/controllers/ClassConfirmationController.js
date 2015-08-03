/**
 * Created by alberto on 8/2/15.
 */
angular.module('Registro').controller('ClassConfirmationController', ['$scope', '$http','$location','$routeParams','$rootScope', function ($scope, $http, $location, $rootScope) {

    $scope.sendSketchInformation = function sendSketchInformation(){
        $http({
            method: 'POST',
            url: '/ControlEscuela/user/sketchMail',
            data: { token: $rootScope.token }
        }).success(function (data) {
            $scope.sucessMessage = data.message;
        }).error(function (data) {
            console.log(data);
            $scope.message = data.message;
            alert(data.message);
        });
    };

}]);