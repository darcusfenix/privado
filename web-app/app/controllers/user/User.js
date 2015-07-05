/**
 * Created by alberto on 3/07/15.
 */
function UserListController($scope, $http, User) {
    $scope.userList = User.query(function queryUser() {
        console.log($scope.userList);
    });
};

function UserEditController($scope) {

};

function UserShowController($scope) {

};
function UserDeleteController($scope, $http) {

};
function UserCreateController($scope) {
    $scope.errors = [];
    $scope.userInstance = {};
    $http({
        method: "GET",
        url: "user/create"
    }).success(function successOnRequest(data) {
        $scope.userInstance = data;
    }).error(function errorOnRequest(data) {
        $scope.errors = data;
    });
};