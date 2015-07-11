/**
 * Created by alberto on 3/07/15.
 */
function MainController($scope, $location, $rootScope){
    $rootScope.location = $location.path();
    $rootScope.nameSpace ="";
    $scope.message = "OK";
}