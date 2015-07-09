/**
 * Created by alberto on 3/07/15.
 */
function UserListController($scope, $location, $rootScope, User, Role) {
    $rootScope.location = $location.path();
    $scope.userList = User.query();
    $scope.roles = Role.query();
};

function UserEditController($scope, $location, $routeParams, $rootScope, User, Role) {
    $rootScope.location = $location.path();
    $scope.userInstance = User.get({id: $routeParams.id});
    $scope.roles = Role.query();
    $scope.updateUser = function updateUser() {
        $scope.userInstance = $scope.userInstance.$update({roleId: $scope.userInstance.authority.id});
        $location.path("/user/show/" + $routeParams.id);
    };
    $scope.cancelar = function cancelar() {
        $location.path("/user/show/" + $routeParams.id);
    };

};

function UserShowController($scope, $location, $routeParams, $rootScope, User) {
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
function UserCreateController($scope, $location, $rootScope, User, Role) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.userInstance = User.create();
    $scope.roles = Role.query();
    $scope.saveUser = function saveUser() {
        $scope.userInstance = $scope.userInstance.$save({roleId: $scope.userInstance.authority.id}, function savedUser(data) {
            $location.path("/user/show/" + data.id);
        });

    };
    $scope.cancelar = function cancelar() {
        $location.path("/user/");
    };
};