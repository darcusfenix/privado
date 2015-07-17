/**
 * Created by fernandotapia on 7/16/15.
 */

function OfficeListController($scope, Office, $location, $rootScope){
    $rootScope.location = $location.path();
    $rootScope.nameSpace = 'Sucursales';
    $scope.officeList = Office.query();
}

function OfficeShowController($scope, $location, $routeParams, $rootScope, Office, Classroom) {
    $rootScope.location = $location.path();
    $scope.officeInstance = Office.get({id: $routeParams.id}, function(data){
        $scope.officeInstance = data;
        $scope.classroomByOffice =  Classroom.getClassroomByOffice({id: $scope.officeInstance.id});
    });
};