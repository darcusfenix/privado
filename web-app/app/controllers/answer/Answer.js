/**
 * Created by darcusfenix on 30/07/15.
 */

function AnswerListController ($scope, $location, $rootScope, Answer) {

    $rootScope.location = $location.path();

    $scope.answerList = Answer.query(function (data) {
        $scope.answerList = data;
        console.log($scope.answerList)
    }, function (err) {
        $location.path("/");
    });

};

function AnswerCreateController ($scope, $location, $rootScope, Answer, Section, Question) {
    $rootScope.location = $location.path();
    $scope.validator = {};

    $scope.sectionList = Section.query();
    $scope.sectionSelected;


    $scope.updateQuestions = function(){
        $scope.questionBySectionList = Question.getBySection({id : $scope.sectionSelected}, function (data) {
            $scope.questionBySectionList = data;
        }, function (err) {
            console.log("no hay preguntas para esta sección");
        });
    }


    $scope.answerInstance = Answer.create(function(data){
        $scope.answerInstance = data;
        $scope.answerInstance.state = false;
    });

    $scope.saveAnswer = function (valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.answerInstance.$save(
                function (data) {
                    $location.path("/answer/show/"+ data.answerInstance.id);

                    $rootScope.message = data.message;
                }, function (err) {
                    console.log(err);
                    if(err.data.errors){
                        $scope.errors = err.data.errors;

                        for (var i = 0; i < $scope.errors.length; i++) {

                            $scope.validator[$scope.errors[i].field] = {
                                hasError: true,
                                message: $scope.errors[i].message
                            }

                        }
                    }
                    if(err.data.error){
                        $rootScope.message = err.data.error;
                    }

                });
            return false;
        } else {
            return false;
        }
    };
};

function AnswerEditController (){}

function AnswerShowController (){}
