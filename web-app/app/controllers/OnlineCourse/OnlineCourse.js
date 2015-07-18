/**
 * Created by darcusfenix on 17/07/15.
 */


function OnlineCourseListController($scope, $location, $rootScope, OnlineCourse, TypeService){

    $rootScope.location = $location.path();
    $scope.onlineCourseList = OnlineCourse.query(function(data){
        $scope.onlineCourseList = data;
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
function OnlineCourseCreateController($scope, $location, $rootScope, $routeParams, ClassroomCourse, TypeService){

    ComponentsPickers.init();

    $scope.onlineCourseInstance = ClassroomCourse.create();
    $scope.typeServiceList = TypeService.query();


    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveOnlineCourse = function saveOnlineCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.online.$save(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                     $scope.classroomCourseInstance = data.classroomCourseInstance;
                     */
                    $location.path("/onlineCourse/show/" + data.onlineCourseInstance.id);

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

    $('#endDate').datepicker().on('changeDate', function(ev){
        $scope.onlineCourseInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.onlineCourseInstance.stDate = $(ev.target).val();
    });
};

function OnlineCourseEditController($scope, $location, $rootScope, $routeParams, OnlineCourse, TypeService){

    ComponentsPickers.init();
    $scope.onlineCourseInstance = OnlineCourse.get({id: $routeParams.id}, function(data){
        $scope.onlineCourseInstance = data;
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

    $('#endDate').datepicker().on('changeDate', function(ev){
        $scope.onlineCourseInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.onlineCourseInstance.stDate = $(ev.target).val();
    });
};


function OnlineCourseShowController($scope, $location, $rootScope, $routeParams, OnlineCourse, TypeService){

    $scope.onlineCourseInstance = OnlineCourse.get({id: $routeParams.id}, function(data){
        $scope.onlineCourseInstance = data;
    }, function(err){
        $location.path("/onlineCourse");
    });
    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };
};
