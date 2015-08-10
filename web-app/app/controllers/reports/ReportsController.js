/**
 * Created by darcusfenix on 9/08/15.
 */

function getStudentsServicesPaidController ($scope, $location, $rootScope, Classroom, Reports) {
    $rootScope.location = $location.path();
    $scope.message = {show: false, type: 0, text: ''}


    $scope.classRoomList = Classroom.query(function (data) {
        console.log($scope.classRoomList);
    });

    $scope.getStudentsByClassroom = function(idClassRoom){

        for(var i = 0; i < $scope.classRoomList.length; i++)
            if($scope.classRoomList[i].id == idClassRoom)
                $scope.classRoomNameCurrent = $scope.classRoomList[i].nameClassroom;

        $scope.studentList = Reports.getStudentsServicesPaid({id: idClassRoom}, function (data) {
            $scope.studentList = data;

        }, function(err){

        });
    };
};