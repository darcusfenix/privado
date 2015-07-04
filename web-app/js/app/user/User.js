/**
 * Created by alberto on 3/07/15.
 */
function UserListController($scope, $http) {
    $scope.userList = [];
    $scope.loadData = function loadData() {
        $http({
            method: "GET",
            url: "user/index"
        }).success(function (data) {
            $scope.userList = data;
        });

    };

    $scope.$watch('currentPage', $scope.loadData);
};

function UserEditController($scope) {

};

function UserShowController($scope) {

};
function UserDeleteController($scope) {

};
function UserCreateController($scope) {
    $scope.user
};