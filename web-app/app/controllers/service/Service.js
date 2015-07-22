/**
 * Created by darcusfenix on 7/15/15.
 */

function ServiceListController ( $scope, $location, $rootScope, $filter, TypeService, Service, TypeCourse){

    $rootScope.location = $location.path();

    $scope.typesServiceList = TypeService.query();
    $scope.typeCourseList = TypeCourse.query();
    $scope.servicesList = Service.query( function(data){
        $scope.servicesList = data;

        for (var i = 0; i < $scope.servicesList.length; i++){
            $scope.servicesList[i].stDate = $filter('date')($scope.servicesList[i].stDate, 'MM/dd/yyyy');
            $scope.servicesList[i].endDate = $filter('date')($scope.servicesList[i].endDate, 'MM/dd/yyyy');
        }

    }, function(err){
        $location.path("/");
    });


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
