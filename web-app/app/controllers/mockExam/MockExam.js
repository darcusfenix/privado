/**
 * Created by darcusfenix on 17/07/15.
 */

function MockExamListController($scope, $location, $rootScope, $filter, MockExam, TypeService) {
    $rootScope.location = $location.path();
    $rootScope.location = $location.path();
    $scope.mockExamList = MockExam.query(function (data) {
        $scope.mockExamList = data;

        for (var i = 0; i < $scope.mockExamList.length; i++) {
            $scope.mockExamList[i].stDate = $filter('date')($scope.mockExamList[i].stDate, 'MM/dd/yyyy');
            $scope.mockExamList[i].endDate = $filter('date')($scope.mockExamList[i].endDate, 'MM/dd/yyyy');
        }

    }, function (err) {
        $location.path("/");
    });

    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function (idService) {
        for (var i = 0; i < $scope.typeServiceList.length; i++)
            if ($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };
}

function MockExamCreateController($scope, $location, $rootScope, MockExam, TypeService) {
    $rootScope.location = $location.path();
    ComponentsPickers.init();

    $scope.mockExamInstance = MockExam.create();
    $scope.typeServiceList = TypeService.query();

    $scope.getNameCourse = function (idCourse) {
        for (var i = 0; i < $scope.typeCourseList.length; i++)
            if ($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };

    $scope.getNameService = function (idService) {
        for (var i = 0; i < $scope.typeServiceList.length; i++)
            if ($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveMockExam = function saveMockExam(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.mockExamInstance.$save(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                     $scope.classroomCourseInstance = data.classroomCourseInstance;
                     */
                    $location.path("/mockExam/show/" + data.mockExamInstance.id);

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

    $('#endDate').datepicker().on('changeDate', function (ev) {
        $scope.mockExamInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function (ev) {
        $scope.mockExamInstance.stDate = $(ev.target).val();
    });
}

function MockExamEditController($scope, $location, $rootScope, $routeParams, $filter, MockExam, TypeService) {
    $rootScope.location = $location.path();
    ComponentsPickers.init();

    $scope.mockExamInstance = MockExam.get({id: $routeParams.id}, function (data) {
        $scope.mockExamInstance = data;
        $scope.mockExamInstance.stDate = $filter('date')($scope.mockExamInstance.stDate, 'MM/dd/yyyy');
        $scope.mockExamInstance.endDate = $filter('date')($scope.mockExamInstance.endDate, 'MM/dd/yyyy');
    }, function (err) {
        $location.path("/mockExam");
    });

    $scope.typeServiceList = TypeService.query();

    $scope.getNameService = function (idService) {
        for (var i = 0; i < $scope.typeServiceList.length; i++)
            if ($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.saveMockExam = function saveMockExam(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.mockExamInstance.$update(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    /*
                     $scope.classroomCourseInstance = data.classroomCourseInstance;
                     */
                    $location.path("/mockExam/show/" + data.mockExamInstance.id);

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

    $('#endDate').datepicker().on('changeDate', function (ev) {
        $scope.mockExamInstance.endDate = $(ev.target).val();
    });
    $('#stDate').datepicker().on('changeDate', function (ev) {
        $scope.mockExamInstance.stDate = $(ev.target).val();
    });
};

function MockExamShowController($scope, $location, $rootScope, $filter, $routeParams, MockExam, TypeCourse, TypeService) {
    $rootScope.location = $location.path();
    $scope.mockExamInstance = MockExam.get({id: $routeParams.id}, function (data) {
        $scope.mockExamInstance = data;
        $scope.mockExamInstance.stDate = $filter('date')($scope.mockExamInstance.stDate, 'MM/dd/yyyy');
        $scope.mockExamInstance.endDate = $filter('date')($scope.mockExamInstance.endDate, 'MM/dd/yyyy');
    }, function (err) {
        $location.path("/mockExam");
    });

    console.log($scope.mockExamInstance);

    $scope.typeCourseList = TypeCourse.query();
    $scope.typeServiceList = TypeService.query();

    $scope.getNameCourse = function (idCourse) {
        for (var i = 0; i < $scope.typeCourseList.length; i++)
            if ($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };

    $scope.getNameService = function (idService) {
        for (var i = 0; i < $scope.typeServiceList.length; i++)
            if ($scope.typeServiceList[i].id === idService)
                return $scope.typeServiceList[i].name;
    };

    $scope.delete = function(){
        $scope.mockExamInstance.$delete({id: $routeParams.id}, function (success) {
            $rootScope.message = success.success;
            $location.path('/mockExam/');
        }, function (err){
            $rootScope.message = err.error;
        });
    };

};
