/**
 * Created by darcusfenix on 16/07/15.
 */

function typeCourseListController ($scope, $location, $rootScope, TypeCourse){

    $rootScope.location = $location.path();

    $scope.typesCourseList = TypeCourse.query();

}


function typeCourseCreateController($scope, $location, $rootScope, TypeCourse) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};
    $scope.typeCourseInstance = TypeCourse.create();



    $scope.savetypeCourse = function savetypeCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.typeCourseInstance.$save(
                function (data) { // 200 HTTP OK
                    console.log(data);

                    $scope.typeCourseInstance = data.typeCourseInstance;
                    $location.path("/type-course/show/" + data.typeCourseInstance.id);
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
        $location.path("/type-course/");
    };
};

function typeCourseEditController($scope, $location, $rootScope, $routeParams, $timeout, TypeCourse) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};
    $scope.typeCourseInstance = TypeCourse.get({id: $routeParams.id});

    $rootScope.message = null;

    $scope.savetypeCourse = function savetypeCourse(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.typeCourseInstance.$update(
                function (data) { // 200 HTTP OK
                    console.log(data);
                    $location.path("/type-course/show/" + data.typeCourseInstance.id);
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
        $location.path("/type-course/");
    };
}

function typeCourseShowController($scope, $location, $rootScope, TypeCourse, $routeParams){
    $rootScope.location = $location.path();

    $scope.typeCourseInstance = TypeCourse.get({id: $routeParams.id});

    $scope.editTypeCourse = function editTypeCourse() {
        $location.path('/type-course/edit/' + $routeParams.id);
    };


    $scope.deleteTypeCourse = function deleteTypeCourse() {
        console.log("eliminando tipo de course")
        /*
         $scope.typeCourseInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
         $rootScope.message = data.message;
         $location.path('/type-Course/');
         });
         */
    };


    $scope.cancelar = function cancelar() {
        $location.path("/type-course/");
    };
}