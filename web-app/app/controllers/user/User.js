/**
 * Created by alberto on 3/07/15.
 */
function UserListController($scope, $location, $rootScope, User, Role) {
    $rootScope.location = $location.path();
    $scope.userList = User.query();
    $scope.roles = Role.query();

    $scope.cancelar = function cancelar() {
        $location.path("/user/show/" + $routeParams.id);
    };


    $scope.sendEmail = function (idStudent) {

        $(".btn").attr("disabled", "disabled");

        User.sendEmail({id: idStudent}, function (data) {

            $rootScope.message = data.message;

            $(".btn").removeAttr("disabled");

        }, function (err) {

            $(".btn").removeAttr("disabled");


        });

    };

};

function UserSendEmailController($scope, $routeParams, $location, VoucherPayment, User, $rootScope, $timeout, $route, StateVoucher, Classroom) {
    $rootScope.location = $location.path();
    $scope.message = {show: false, type: 0, text: ''}


    $scope.classRoomList = Classroom.query(function (data) {

    });

    $scope.idClassRoom = 0;

    $scope.getStudentsByClassroom = function (idClassRoom) {
        $scope.idClassRoom = idClassRoom;
        for (var i = 0; i < $scope.classRoomList.length; i++)
            if ($scope.classRoomList[i].id == idClassRoom)
                $scope.classRoomNameCurrent = $scope.classRoomList[i].nameClassroom;

        $scope.studentList = Classroom.getUsersByClassroom({id: idClassRoom}, function (data) {

            $scope.studentList = data;

        }, function (err) {

        });
    };

    $scope.sentoToAllStudents = function(){

        User.sendEmailExamToAllStudents({id: $scope.idClassRoom}, function (data) {

        });
    };

    $scope.sendEmailExam = function (idStudent) {

        $(".btn").attr("disabled", "disabled");

        User.sendEmailExam({id: idStudent}, function (data) {

            $rootScope.message = data.message;

            $(".btn").removeAttr("disabled");

        }, function (err) {

            $(".btn").removeAttr("disabled");


        });

    };

};

function UserListClass($scope, $location, $rootScope, User, Role) {
    $rootScope.location = $location.path();
    $scope.userList = User.query();
    $scope.roles = Role.query();
};

function UserEditController($scope, $location, $routeParams, $rootScope, User, Role, Classroom) {
    $rootScope.location = $location.path();

    $scope.userInstance = User.get({id: $routeParams.id}, function (data) {
        $scope.userInstance = data;

    });

    $scope.roles = Role.query(function roles(data) {
        $scope.roles = data;
    });
    $scope.classroomList = Classroom.query();
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
    $scope.deleteUser = function deleteUser(tdelete) {
        $scope.userInstance.$delete({
            id: $routeParams.id, td: tdelete
        }, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/user/');
        }, function (error) {
            $("#messageError").html(error.data.message + error.data.depen);
            $('#model-confirm2').modal('toggle');
        });
    };
};
function UserCreateController($scope, $location, $rootScope, User, Role, Classroom) {
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};
    $scope.userInstance = User.create();
    $scope.roles = Role.query(function roles(data) {
        $scope.roles = data;
    });
    $scope.classroomList = Classroom.query();
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