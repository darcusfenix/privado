/**
 * Created by darcusfenix on 17/07/15.
 */


function ClassroomCourseListController($scope, $location, $rootScope, $filter, ClassroomCourse, TypeCourse, TypeService){

    $rootScope.location = $location.path();
    $scope.classroomCourseList = ClassroomCourse.query( function(data){
        $scope.classroomCourseList = data;

        for (var i = 0; i < $scope.classroomCourseList.length; i++){
            $scope.classroomCourseList[i].stDate = $filter('date')($scope.classroomCourseList[i].stDate, 'MM/dd/yyyy');
            $scope.classroomCourseList[i].endDate = $filter('date')($scope.classroomCourseList[i].endDate, 'MM/dd/yyyy');
        }

    }, function(err){
        $location.path("/");
    });

    $scope.typeCourseList = TypeCourse.query();
    $scope.typeServiceList = TypeService.query();

    $scope.getNameCourse = function(idCourse){
        for(var i = 0; i < $scope.typeCourseList.length; i++)
            if($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

};
function ClassroomCourseCreateController($scope, $location, $rootScope, ClassroomCourse, TypeCourse, TypeService){
    $rootScope.location = $location.path();

    ComponentsPickers.init();

    $scope.classroomCourseInstance = ClassroomCourse.create();
    $scope.typeCourseList = TypeCourse.query();
    $scope.typeServiceList = TypeService.query();

    $scope.getNameCourse = function(idCourse){
        for(var i = 0; i < $scope.typeCourseList.length; i++)
            if($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveClassroomCourse = function saveClassroomCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.classroomCourseInstance.$save(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                     $scope.classroomCourseInstance = data.classroomCourseInstance;
                     */
                    $location.path("/classroomCourse/show/" + data.classroomCourseInstance.id);

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
        $scope.classroomCourseInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.classroomCourseInstance.stDate = $(ev.target).val();
    });
};

function ClassroomCourseEditController($scope, $location, $rootScope, $routeParams, $filter, ClassroomCourse, TypeCourse, TypeService){
    $rootScope.location = $location.path();
    ComponentsPickers.init();

    $scope.classroomCourseInstance = ClassroomCourse.get({id: $routeParams.id}, function(data){
        $scope.classroomCourseInstance = data;
        $scope.classroomCourseInstance.stDate = $filter('date')($scope.classroomCourseInstance.stDate, 'MM/dd/yyyy');
        $scope.classroomCourseInstance.endDate = $filter('date')($scope.classroomCourseInstance.endDate, 'MM/dd/yyyy');
    }, function(err){
        $location.path("/classroomCourse");
    });


    $scope.typeCourseList = TypeCourse.query();
    $scope.typeServiceList = TypeService.query();

    $scope.getNameCourse = function(idCourse){
        for(var i = 0; i < $scope.typeCourseList.length; i++)
            if($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveClassroomCourse = function saveClassroomCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.classroomCourseInstance.stDate = $filter('date')($scope.classroomCourseInstance.stDate, 'MM/dd/yyyy');
            $scope.classroomCourseInstance.endDate = $filter('date')($scope.classroomCourseInstance.endDate, 'MM/dd/yyyy');
            $scope.classroomCourseInstance.$update(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                    $scope.classroomCourseInstance = data.classroomCourseInstance;
                    */
                    $location.path("/classroomCourse/show/" + data.classroomCourseInstance.id);

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
        $scope.classroomCourseInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function(ev){
        $scope.classroomCourseInstance.stDate = $(ev.target).val();
    });
};
function ClassroomCourseShowController($scope, $location, $rootScope, $routeParams, $filter, ClassroomCourse, TypeCourse, TypeService){
    $rootScope.location = $location.path();
    $scope.classroomCourseInstance = ClassroomCourse.get({id: $routeParams.id}, function(data){
        $scope.classroomCourseInstance = data;
        $scope.classroomCourseInstance.stDate = $filter('date')($scope.classroomCourseInstance.stDate, 'MM/dd/yyyy');
        $scope.classroomCourseInstance.endDate = $filter('date')($scope.classroomCourseInstance.endDate, 'MM/dd/yyyy');
    }, function(err){
        $location.path("/classroomCourse");
    });

    console.log($scope.classroomCourseInstance.stDate =  $filter('date')($scope.classroomCourseInstance.stDate, 'yyyy-MM-dd'));

    $scope.typeCourseList = TypeCourse.query();
    $scope.typeServiceList = TypeService.query();

    $scope.getNameCourse = function(idCourse){
        for(var i = 0; i < $scope.typeCourseList.length; i++)
            if($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };

    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typeServiceList.length; i++)
            if($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };
};
