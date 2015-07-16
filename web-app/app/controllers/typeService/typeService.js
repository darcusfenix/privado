/**
 * Created by darcusfenix on 15/07/15.
 */

function typeServiceListController ($scope, $location, $rootScope, TypeService){

    $rootScope.location = $location.path();

    $scope.typesServiceList = TypeService.query();

}


function typeServiceCreateController($scope, $location, $rootScope, TypeService) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};
    $scope.typeServiceInstance = TypeService.create();



    $scope.savetypeService = function savetypeService(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.typeServiceInstance.$save(
                function (data) { // 200 HTTP OK
                    console.log(data);

                    $scope.typeServiceInstance = data.typeServiceInstance;
                    $location.path("/type-service/show/" + data.typeServiceInstance.id);
                    $rootScope.message = data.message;

                }, function (error) { // 50* HTTP ERROR
                    /*
                    $scope.errors = error.data.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                    console.log($scope.validator);
                    */
                    console.log(error);
                });
            return false;
        } else {
            return false;
        }

    };

    $scope.cancelar = function cancelar() {
        $location.path("/type-service/");
    };
};

function typeServiceditController($scope, $location, $rootScope, $routeParams, $timeout, TypeService) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};
    $scope.typeServiceInstance = TypeService.get({id: $routeParams.id});

    $rootScope.message = null;

    $scope.savetypeService = function savetypeService(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.typeServiceInstance.$update(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    $location.path("/type-service/show/" + data.typeService.id);
                    $rootScope.message = data.message;
                }, function (error) { // 50* HTTP ERROR
                    /*
                     $scope.errors = error.data.errors;
                     for (var i = 0; i < $scope.errors.length; i++) {
                     $scope.validator[$scope.errors[i].field] = {
                     hasError: true,
                     message: $scope.errors[i].message
                     }
                     }
                     console.log($scope.validator);
                     */
                    console.log(error);
                });
            return false;
        } else {
            return false;
        }

    };

    $scope.cancelar = function cancelar() {
        $location.path("/type-service/");
    };
}

function typeServiceShowController($scope, $location, $rootScope, TypeService, $routeParams){
    $rootScope.location = $location.path();

    $scope.typeServiceInstance = TypeService.get({id: $routeParams.id});

    $scope.editTypeService = function editTypeService() {
        $location.path('/type-service/edit/' + $routeParams.id);
    };


    $scope.deleteTypeService = function deleteTypeService() {
        console.log("eliminando tipo de servicio")
        /*
        $scope.typeServiceInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/type-service/');
        });
        */
    };


    $scope.cancelar = function cancelar() {
        $location.path("/type-service/");
    };
}