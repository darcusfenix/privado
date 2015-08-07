/**
 * Created by darcusfenix on 6/08/15.
 */

angular.module('Registro').controller('foreignStudentController', ['$scope', '$http', '$location', '$routeParams', '$rootScope', function ($scope, $http, $location, $routeParams, $rootScope) {
    $rootScope.token = $routeParams.token || "";

    $scope.token = $routeParams.token;

    $scope.messageTime = null;

    $http({
        method: 'GET',
        url: '/ControlEscuela/user/activate/',
        params: {token: $routeParams.token}
    }).success(function (data) {
        $("#content").removeClass("ocultar");
        $http({
            method: 'GET',
            url: '/ControlEscuela/user/activate/',
            params: {token: $routeParams.token}
        }).success(function (data) {

            $http({
                method: 'POST',
                url: '/ControlEscuela/user/sendEmailToforeignStudent/',
                params: {
                    token: $routeParams.token
                }
            }).success(function (data) {
                console.log(data);

            }).error(function (data) {
                console.log(data);
                $scope.message = data.message;
                //alert(data.message);
            });
        }).error(function (data) {
            console.log(data);
            $scope.message = data.message;
            alert(data.message);
        });
    }).error(function (data) {
        console.log(data);
        $scope.message = data.message;
        alert(data.message);
    });



    //$scope.sendEmailToforeignStudent = function ($event) {
//        $event.preventDefault();


    //};

}]);