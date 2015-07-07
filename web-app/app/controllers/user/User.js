/**
 * Created by alberto on 3/07/15.
 */
function UserListController($scope, User, $location, $rootScope) {
        $rootScope.location = $location.path();
    $scope.userList = User.query();
};

function UserEditController($scope, $location, $routeParams, User, $rootScope) {
    $rootScope.location = $location.path();
    $scope.userInstance = User.get({id: $routeParams.id});
    $scope.updateUser = function updateUser() {
        $scope.userInstance = $scope.userInstance.$update();
        $location.path("/user/show/" + $routeParams.id);
    };
    $scope.cancelar = function cancelar() {
        $location.path("/user/show/" + $routeParams.id);
    };

};

function UserShowController($scope, $location, $routeParams, User, $rootScope) {
    $rootScope.location = $location.path();
    User.get({id: $routeParams.id}).$promise.then(function (user) {
        $scope.userInstance = user;
    });
    $scope.editUser = function editUser() {
        $location.path('/user/edit/' + $routeParams.id);
    };
    $scope.deleteUser = function deleteUser() {
        $scope.userInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $location.path('/user/');
        });
    };
};
function UserCreateController($scope, $location, User, $rootScope) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.userInstance = User.create();
    $scope.saveUser = function saveUser() {
        $scope.userInstance = $scope.userInstance.$save(function savedUser(data) {
            $location.path("/user/show/" + data.id);
        });

    };
    $scope.cancelar = function cancelar() {
        $location.path("/user/");
    };
};