/**
 * Created by alberto on 24/07/15.
 */
angular.module('Registro').controller('ActivateController', ['$scope', '$http','$location','$routeParams', function ($scope, $http, $location,$routeParams) {
    $http({
        method: 'POST',
        url: '/ControlEscuela/user/activate',
        data: { token: $routeParams.token }
    }).success(function (data) {
        console.log(data);
        // Render view with generated date or info related
        $location.path("/correo/");
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
    });
}]);