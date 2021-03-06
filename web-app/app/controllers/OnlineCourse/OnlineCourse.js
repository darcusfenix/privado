/**
 * Created by darcusfenix on 17/07/15.
 */


function OnlineCourseListController($scope, $location, $rootScope, $filter, OnlineCourse, TypeService){

    $rootScope.location = $location.path();
    $scope.onlineCourseList = OnlineCourse.query(function(data){
        $scope.onlineCourseList = data;
        for (var i = 0; i < $scope.onlineCourseList.length; i++){
            $scope.onlineCourseList[i].stDate = $filter('date')($scope.onlineCourseList[i].stDate, 'MM/dd/yyyy');
            $scope.onlineCourseList[i].endDate = $filter('date')($scope.onlineCourseList[i].endDate, 'MM/dd/yyyy');
        }
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
function OnlineCourseCreateController($scope, $location, $rootScope , OnlineCourse, TypeService){
    $rootScope.location = $location.path();
    $scope.validator = {};
    ComponentsPickers.init();

    $scope.onlineCourseInstance = OnlineCourse.create();
    $scope.typeServiceList = TypeService.query();


    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveOnlineCourse = function saveOnlineCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.onlineCourseInstance.$save(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                     $scope.classroomCourseInstance = data.classroomCourseInstance;
                     */
                    $location.path("/onlineCourse/show/" + data.onlineCourseInstance.id);

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
        $scope.onlineCourseInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.onlineCourseInstance.stDate = $(ev.target).val();
    });
};

function OnlineCourseEditController($scope, $location, $rootScope, $routeParams, $filter, OnlineCourse, TypeService){
    $rootScope.location = $location.path();
    $scope.validator = {};
    ComponentsPickers.init();
    $scope.onlineCourseInstance = OnlineCourse.get({id: $routeParams.id}, function(data){
        $scope.onlineCourseInstance = data;
        $scope.onlineCourseInstance.stDate = $filter('date')($scope.onlineCourseInstance.stDate, 'MM/dd/yyyy');
        $scope.onlineCourseInstance.endDate = $filter('date')($scope.onlineCourseInstance.endDate, 'MM/dd/yyyy');
    }, function(err){
        $location.path("/onlineCourse");
    });

    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveOnlineCourse = function saveOnlineCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.onlineCourseInstance.$update(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                     $scope.classroomCourseInstance = data.classroomCourseInstance;
                     */
                    $location.path("/onlineCourse/show/" + data.onlineCourseInstance.id);

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
        $scope.onlineCourseInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.onlineCourseInstance.stDate = $(ev.target).val();
    });
};


function OnlineCourseShowController($scope, $location, $filter, $routeParams, $rootScope, OnlineCourse, TypeService){
    $rootScope.location = $location.path();
    
    $scope.onlineCourseInstance = OnlineCourse.get({id: $routeParams.id}, function(data){
        $scope.onlineCourseInstance = data;
        $scope.onlineCourseInstance.stDate = $filter('date')($scope.onlineCourseInstance.stDate, 'MM/dd/yyyy');
        $scope.onlineCourseInstance.endDate = $filter('date')($scope.onlineCourseInstance.endDate, 'MM/dd/yyyy');
    }, function(err){
        $location.path("/onlineCourse");
    });
    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.delete = function(){
        $scope.onlineCourseInstance.$delete({id: $routeParams.id}, function (success) {
            $rootScope.message = success.success;
            $location.path('/onlineCourse/');
        }, function (err){
            $rootScope.message = err.error;
        });
    };

};
