/**
 * Created by darcusfenix on 7/15/15.
 */

function ServiceListController ( $scope, $location, $rootScope, TypeService, Service){

    $rootScope.location = $location.path();

    //$scope.typesServiceList = TypeService.query();
    $scope.servicesList = Service.query();
}

function ServiceCreateController (){

}
function ServiceditController (){

}
function ServiceShowController (){

}
