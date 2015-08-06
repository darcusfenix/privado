/**
 * Created by alberto on 8/2/15.
 */
angular.module('Registro').controller('ClassConfirmationController', ['$scope', '$http','$routeParams', function ($scope, $http, $routeParams) {
    $scope.sendSketchInformation = function sendSketchInformation($event){
        $event.preventDefault();
        $http({
            method: 'POST',
            url: '/ControlEscuela/user/sketchMail',
            params: { token: $routeParams.token }
        }).success(function (data) {
            $scope.sucessMessage = data.message;
            $scope.mailMessage = data.message;
        }).error(function (data) {
            console.log(data);
            $scope.message = data.message;
            $scope.mailMessage = data.mailMessage;
            alert(data.message);
        });
    };

    $http({
        method: 'GET',
        url: '/ControlEscuela/user/activateClassroomPlace/',
        params: { token: $routeParams.token }
    }).success(function (data) {
        console.log(data);
        $scope.enrollmentInformation = data;
        $("#content").removeClass("ocultar");
        init_lightbox();
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
        alert(data.message);
    });

}]);