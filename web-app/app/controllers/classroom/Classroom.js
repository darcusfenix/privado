/**
 * By Tapia Mujica Fernando 10/07/15
 */

function ClassroomListController($scope, Classroom, StateClassroom, $location, $rootScope) {
    $rootScope.location = $location.path();
    $scope.classroomList = Classroom.query();
    $scope.stateClassroomList = StateClassroom.query();
    $rootScope.nameSpace = 'Grupos';

    $scope.getNameState = function (idState){
        var name = "";
        for(i = 0; i < $scope.stateClassroomList.length; i++){
            if(idState == $scope.stateClassroomList[i].id){
                name = $scope.stateClassroomList[i].name;
            }
        }
        return name;
    };

};

function ClassroomCreateController($scope, $location, Classroom, Office, $rootScope) {

    ComponentsPickers.init();

    $scope.varSlc = 0;

    $scope.officeList = Office.query()

    $scope.validatorFecha = {
        hasError: false,
        message: "El campo de fecha es requerido para agregar una clase."
    }

    $scope.validatorTema = {
        hasError: false,
        message: "El campo tema es requerido para agregar una clase."
    }


    $('.dp').datepicker().on('changeDate', function(ev){
        $scope.lesson.dateClass = $(ev.target).val();
    });

    $scope.lessonList = [];
    $scope.lesson = {};
    $rootScope.nameSpace = 'Grupos';
    $rootScope.location = $location.path();
    $scope.lesson = [];
    $scope.errors = [];
    $scope.classroomInstance = Classroom.create(function(data){
        $scope.classrromInstance = data;
    });
    $scope.saveGroup = function saveGroup(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.classroomInstance.$save({lista:crearJSON($scope.lessonList), idOffice: $scope.varSlc}, function (data) { // 200 HTTP OK
                    $scope.classroomInstance = data.classroom;
                    $location.path("/classroom/");
                    $rootScope.message = data.message;
                }, function (error) { // 50* HTTP ERROR
                    $scope.errorDate = {
                        message : error.data.message,
                        estatus : true
                    };
                    $('.modal').modal('toggle');
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

        /*$scope.classroomInstance = $scope.classroomInstance.$save(function savedClassroom(data) {
            $location.path("/classroom/create");
        });*/
    };
    $scope.cancelar = function cancelar() {
        $location.path("/classroom/");
    };

    $scope.agregarFila = function agregarFila(fila){
        $scope.lesson.stHour = $('.tp').val();
        $scope.lesson.endHour = $('.tp2').val();
        if($scope.lesson.dateClass != null) {
            if($scope.lesson.name != null) {
                $scope.lessonList.push(fila);
                crearJSON($scope.lessonList)
                $scope.validatorTema.hasError = false;
            }else{
                $scope.validatorTema.hasError = true;
            }
            $scope.validatorFecha.hasError = false;
        }else{
            mostrarMensaje();
            $scope.validatorFecha.hasError = true;
        }
        $('.dp').val("");
        $('.tp').val("");
        $('.tp2').val("");
        $scope.lesson={};
    };

    $scope.eliminarFila = function eliminarFila(index){
        $scope.lessonList.splice(index, 1);
    };

    function mostrarMensaje(){
        if($scope.lesson.name != null) {
            $scope.validatorTema.hasError = false;
        }else{
            $scope.validatorTema.hasError = true;
        }
    }

    function crearJSON(array){
        var jsonClassroom = "";
        for(i  = 0; i < array.length ; i++){
            if (i < array.length-1){
                jsonClassroom = jsonClassroom + '{"name":"'+array[i].name+'", "dateClass":"'+array[i].dateClass+'", "stHour":"'+array[i].stHour+'", "endHour":"'+array[i].endHour+'"},,'
            }else{
                jsonClassroom = jsonClassroom + '{"name":"'+array[i].name+'", "dateClass":"'+array[i].dateClass+'", "stHour":"'+array[i].stHour+'", "endHour":"'+array[i].endHour+'"}'
            }
        }
        //var obj = JSON.parse(jsonClassroom);
        return jsonClassroom;
    }

};

