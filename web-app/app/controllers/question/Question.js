/**
 * Created by fernandoTapia on 31/07/15.
 */

function QuestionListController($scope, $location, $rootScope, Question) {

    $rootScope.location = $location.path();

    $scope.questionList = Question.query(function (data) {
        $scope.questionList = data;
        console.log($scope.questionList)
    }, function (err) {
        $location.path("/");
    });

};


function QuestionCreateController($scope, $location, $rootScope, Section, Question, Upload) {
    $rootScope.location = $location.path();
    FormDropzone.init();
    $scope.validator = {};
    $scope.varSlc = 0;

    $scope.sectionList = Section.query(function (data) {
        if ($scope.sectionList.length > 0) {
            $scope.questionInstance = Question.create();
        }
    });

    $scope.saveQuestion = function (valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.questionInstance.section = $scope.varSlc;
            Upload.upload({
                url: 'question/save',
                data: $scope.questionInstance,
                file: $scope.file,
                fileFormDataName: 'file'
            }).progress(function (evt) {
                console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
            }).success(function (data, status, headers, config) {
                $location.path("/question/");
                $rootScope.message = data.message;
            }).error(function (error) {
                $scope.messageImage = error.message;
                if (error.errors) {
                    $scope.errors = error.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                }
            });
            return true;
        } else {
            return false;
        }

    };
};


function QuestionEditController($scope, $location, $routeParams, $rootScope, Section, Question, Upload) {
    $rootScope.location = $location.path();
    $scope.validator = {};

    $scope.sectionList = Section.query(function (data) {
        $scope.questionInstance = Question.get({id: $routeParams.id}, function (data) {
            $scope.questionInstance = data;
            $scope.varSlc = data.section.id;
            //$("#fileImage").attr("value","data.urlImg");
        }, function (err) {
            $location.path('/');
        });
    });

    $scope.editQuestion = function editQuestion(valid, $event) {
        $event.preventDefault();
        if (valid) {
            var f = $scope.file
            $scope.questionInstance.section = $scope.varSlc;
            Upload.upload({
                url: 'question/update',
                data: $scope.questionInstance,
                file: $scope.file,
                fileFormDataName: 'file'
            }).progress(function (evt) {
                console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
            }).success(function (data, status, headers, config) {
                $location.path("/question/");
                $rootScope.message = data.message;
            }).error(function (error) {
                $scope.messageImage = error.message;
                if (error.errors) {
                    $scope.errors = error.errors;
                    for (var i = 0; i < $scope.errors.length; i++) {
                        $scope.validator[$scope.errors[i].field] = {
                            hasError: true,
                            message: $scope.errors[i].message
                        }
                    }
                }
            });
            return true;
        } else {
            return false;
        }
    };

    $scope.changeForm = function () {
        $scope.updateQuestion.$dirty = true;
    }
};

function QuestionShowController($scope, $location, $rootScope, $routeParams, Section, Question) {
    $rootScope.location = $location.path();

    $scope.questionInstance = Question.get({id: $routeParams.id});

    $scope.editQuestion = function editQuestion() {
        $location.path('/question/edit/' + $routeParams.id);
    };

    $scope.deleteQuestion = function deleteQuestion() {
        $scope.questionInstance.$delete({id: $routeParams.id}, function deletedResource(data) {
            $rootScope.message = data.message;
            $location.path('/question/');
        }, function (error) {
            $scope.messageQuestion = error.data.message;
        });
    };

};