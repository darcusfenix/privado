/**
 * By Tapia Mujica Fernando 10/07/15
 */
function ClassroomListController($scope, Classroom, $location, $rootScope) {
    $rootScope.location = $location.path();
    $scope.classroomList = Classroom.query();
    $rootScope.nameSpace = 'Grupos';
};

function ClassroomCreateController($scope, $location, Classroom, $rootScope) {
    $rootScope.nameSpace = 'Grupos';
    $rootScope.location = $location.path();
    var objetoJSON = {"usuario":"user","password":"123456"};
    $scope.errors = [];
    $scope.classroomInstance = Classroom.create();
    $scope.saveClassroom = function saveClassroom() {
        $scope.classroomInstance = $scope.classroomInstance.$save(function savedClassroom(data) {
            $location.path("/classroom/create");
        });
    };
    $scope.cancelar = function cancelar() {
        $location.path("/classroom/");
    };
};