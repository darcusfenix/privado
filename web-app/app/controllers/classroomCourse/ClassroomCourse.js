/**
 * Created by darcusfenix on 17/07/15.
 */


function ClassroomCourseListController($scope, $location, $rootScope, ClassroomCourse, TypeCourse, TypeService){

    $rootScope.location = $location.path();
    $scope.classroomCourseList = ClassroomCourse.query();
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
function ClassroomCourseCreateController(){

};
function ClassroomCourseEditController(){

};
function ClassroomCourseShowController(){

};
