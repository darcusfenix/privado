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
    User.get({id: $routeParams.id}, function (data) {
        $scope.userInstance = data;
    });
    $scope.roles = Role.query(function roles(data) {
        $scope.roles = data;
    });
    $scope.updateUser = function updateUser(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.userInstance.$update(
                {
                    roleId: $scope.userInstance.authority.id
                }, function (data) { // 200 HTTP OK
                    $scope.userInstance = data.user;
                    $location.path("/user/show/" + data.user.id);
                    $rootScope.message = data.message;
                }, function (error) { // 50* HTTP ERROR
                    $scope.errors = error.data.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                });
            return false;
        }
    };
    $scope.cancelar = function cancelar() {
        $location.path("/user/show/" + $routeParams.id);
    };
};

function UserShowController($scope, $location, $routeParams, $rootScope, User) {
    $rootScope.location = $location.path();
    $scope.userInstance = User.get({id: $routeParams.id});

    $scope.editUser = function editUser() {
        $location.path('/user/edit/' + $routeParams.id);
    };
    $scope.deleteUser = function deleteUser() {
        $scope.userInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/user/');
        });
    };
};
function UserCreateController($scope, $location, $rootScope, User, Role) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};
    $scope.userInstance = User.create();
    $scope.roles = Role.query(function roles(data) {
        $scope.roles = data;
    });
    $scope.saveUser = function saveUser(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.userInstance.$save(
                {
                    roleId: $scope.userInstance.authority.id
                }, function (data) { // 200 HTTP OK
                    $scope.userInstance = data.user;
                    $location.path("/user/show/" + data.user.id);
                    $rootScope.message = data.message;
                }, function (error) { // 50* HTTP ERROR
                    $scope.errors = error.data.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                    console.log($scope.validator);
                });
            return false;
        } else {
            return false;
        }

    };

    $scope.cancelar = function cancelar() {
        $location.path("/user/");
    };
};