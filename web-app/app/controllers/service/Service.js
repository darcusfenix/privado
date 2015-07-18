/**
 * Created by darcusfenix on 7/15/15.
 */

function ServiceListController ( $scope, $location, $rootScope, TypeService, Service, TypeCourse){

    $rootScope.location = $location.path();

    $scope.typesServiceList = TypeService.query();
    $scope.servicesList = Service.query();
    $scope.typeCourseList = TypeCourse.query();


    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.typesServiceList.length; i++)
            if($scope.typesServiceList[i].id === idService)
                return $scope.typesServiceList[i].name;
    };

    $scope.getNameCourse = function(idCourse){
        for(var i = 0; i < $scope.typeCourseList.length; i++)
            if($scope.typeCourseList[i].id === idCourse)
                return $scope.typeCourseList[i].name;
    };
}

function ServiceCreateController (){

}
function ServiceditController (){

}
function ServiceShowController (){

}
