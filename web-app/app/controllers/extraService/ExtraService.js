/**
 * Created by darcusfenix on 20/07/15.
 */


function ExtraServiceListController($scope, $location, $rootScope, $filter, ExtraService, TypeService){

    $rootScope.location = $location.path();
    $scope.extraServiceList = ExtraService.query( function(data){
        $scope.extraServiceList = data;

        for (var i = 0; i < $scope.extraServiceList.length; i++){
            $scope.extraServiceList[i].stDate = $filter('date')($scope.extraServiceList[i].stDate, 'MM/dd/yyyy');
            $scope.extraServiceList[i].endDate = $filter('date')($scope.extraServiceList[i].endDate, 'MM/dd/yyyy');
        }
        console.log($scope.extraServiceList)
    }, function(err){
        $location.path("/");
    });

    $scope.typeServiceList = TypeService.query();


    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };
}
function ExtraServiceCreateController($scope, $location, $rootScope, ExtraService, TypeService){
    $rootScope.location = $location.path();
    $scope.validator = {};
    ComponentsPickers.init();

    $scope.extraServiceInstance = ExtraService.create(function (data) {
        $scope.extraServiceInstance = data;
        $scope.extraServiceInstance.active = false;
    });
    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveExtraService = function saveExtraService(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.extraServiceInstance.$save(
                function (data) {
                    $location.path("/extraService/show/" + data.extraServiceInstance.id);

                    $rootScope.message = data.message;
                }, function (err) {

                    $scope.errors = err.data.errors;

                    for (var i = 0; i < $scope.errors.length; i++) {

                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }

                    }
                });
            return false;
        } else {
            return false;
        }
    };

    $('#endDate').datepicker().on('changeDate', function(ev){
        $scope.extraServiceInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.extraServiceInstance.stDate = $(ev.target).val();
    });
};



function ExtraServiceEditController($scope, $location, $rootScope, $routeParams, $filter, ExtraService, TypeService) {
    $rootScope.location = $location.path();
    $scope.validator = {};
    ComponentsPickers.init();

    $scope.extraServiceInstance = ExtraService.get({id: $routeParams.id}, function (data) {
        $scope.extraServiceInstance = data;
        $scope.extraServiceInstance.stDate = $filter('date')($scope.extraServiceInstance.stDate, 'MM/dd/yyyy');
        $scope.extraServiceInstance.endDate = $filter('date')($scope.extraServiceInstance.endDate, 'MM/dd/yyyy');
    }, function (err) {
        $location.path("/classroomCourse");
    });

    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function (idService) {
        for (var i = 0; i < $scope.typeServiceList.length; i++)
            if ($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveExtraService = function ExtraService(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.extraServiceInstance.stDate = $filter('date')($scope.extraServiceInstance.stDate, 'MM/dd/yyyy');
            $scope.extraServiceInstance.endDate = $filter('date')($scope.extraServiceInstance.endDate, 'MM/dd/yyyy');
            $scope.extraServiceInstance.$update(
                function (data) {
                    $location.path("/extraService/show/" + data.extraServiceInstance.id);

                    $rootScope.message = data.message;
                }, function (err) {

                    $scope.errors = err.data.errors;

                    for (var i = 0; i < $scope.errors.length; i++) {

                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }

                    }
                });
            return false;
        } else {
            return false;
        }
    };

    $('#endDate').datepicker().on('changeDate', function (ev) {
        $scope.extraServiceInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function (ev) {
        $scope.extraServiceInstance.stDate = $(ev.target).val();
    });
};

function ExtraServiceShowController($scope, $location, $rootScope, $routeParams, $filter, ExtraService, TypeService){
    $rootScope.location = $location.path();
    $scope.extraServiceInstance = ExtraService.get({id: $routeParams.id}, function(data){
        $scope.extraServiceInstance = data;
        $scope.extraServiceInstance.stDate = $filter('date')($scope.extraServiceInstance.stDate, 'MM/dd/yyyy');
        $scope.extraServiceInstance.endDate = $filter('date')($scope.extraServiceInstance.endDate, 'MM/dd/yyyy');
        console.log($scope.extraServiceInstance);
    }, function(err){
        $location.path("/extraService");
    });

    $scope.typeServiceList = TypeService.query();


    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.delete = function(){
        $scope.extraServiceInstance.$delete({id: $routeParams.id}, function (success) {
            $rootScope.message = success.success;
            $location.path('/extraService/');
        }, function (err){
            $rootScope.message = err.error;
        });
    };

};