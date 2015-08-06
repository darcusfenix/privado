/**
 * Created by darcusfenix on 30/07/15.
 */

function AnswerListController($scope, $location, $rootScope, $templateCache, Answer) {


    $rootScope.location = $location.path();

    $scope.answerList = Answer.query(function (data) {
        window.onload = function(){
            $scope.answerList = data;
            var head = document.getElementsByTagName("head")[0], script;
            script = document.createElement("script");
            script.type = "text/x-mathjax-config";
            script[(window.opera ? "innerHTML" : "text")] =
                "MathJax.Hub.Config({\n" +
                "  tex2jax: { inlineMath: [['$','$'], ['\\\\(','\\\\)']] }\n" +
                "});"
            head.appendChild(script);
            script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
            head.appendChild(script);
        };
    }, function (err) {
        $location.path('/');
    });


};

function AnswerCreateController($scope, $location, $rootScope, Answer, Section, Question, Upload) {
    $rootScope.location = $location.path();
    $scope.validator = {};

    $scope.sectionList = Section.query();
    $scope.sectionSelected;
    $scope.optionAnswer = 0;

    var editor;
    editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en', 'toolbar': '<toolbar ref="chemistry"/>'});
    editor.insertInto(document.getElementById('editorContainer'));


    FormDropzone.init();

    $(".wrs_linkButton").remove();
    $(".wrs_imageContainer").remove();


    $scope.updateQuestions = function () {
        $scope.questionBySectionList = Question.getBySection({id: $scope.sectionSelected}, function (data) {
            $scope.questionBySectionList = data;
        }, function (err) {
            console.log("no hay preguntas para esta sección");
        });
    };


    $scope.answerInstance = Answer.create(function (data) {
        $scope.answerInstance = data;
        $scope.answerInstance.state = false;


        console.log($scope.answerInstance);
    });

    $scope.saveAnswer = function (valid, $event) {
        $event.preventDefault();
        if (valid) {
            if ($scope.answerInstance.typeAnswer == 3) {
                $scope.answerInstance.textAnswer = editor.getMathML();
            }
            Upload.upload({
                url: 'answer/save',
                method: 'post',
                data: $scope.answerInstance,
                file: $scope.file,
                fileFormDataName: 'file'
            }).progress(function (evt) {
                console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
            }).success(function (data, status, headers, config) {
                $location.path("/answer/");
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

function AnswerEditController($scope, $location, $rootScope, $routeParams, Answer, Section, Question, Upload) {
    $rootScope.location = $location.path();
    $scope.validator = {};

    $scope.optionAnswer = 0;

    var editor;
    editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en', 'toolbar': '<toolbar ref="chemistry"/>'});
    editor.insertInto(document.getElementById('editorContainer'));

    FormDropzone.init();

    $(".wrs_linkButton").remove();
    $(".wrs_imageContainer").remove();

    $scope.sectionList = Section.query();

    $scope.sectionSelected;

    $scope.answerInstance = Answer.get({id: $routeParams.id}, function (data) {

        $scope.answerInstance = data;

        if ($scope.answerInstance.typeAnswer == 3) {
            editor.setMathML($scope.answerInstance.textAnswer);
        }

        console.log($scope.answerInstance);

        $scope.question = Question.get({id: $scope.answerInstance.question.id}, function (data) {

            $scope.question = data;
            console.log($scope.question)

            $scope.questionBySectionList = Question.getBySection({id: $scope.question.section.id}, function (data) {

                $scope.questionBySectionList = data;

            }, function (err) {

                console.log("no hay preguntas para esta sección");

            });

        });

    }, function (err) {
        $location.path('/');
    });


    $scope.updateQuestions = function () {
        $scope.questionBySectionList = Question.getBySection({id: $scope.sectionSelected}, function (data) {
            $scope.questionBySectionList = data;
        }, function (err) {
            console.log("no hay preguntas para esta sección");
        });
    };


    $scope.saveAnswer = function (valid, $event) {
        $event.preventDefault();
        if (valid) {
            // si es ecuación
            if ($scope.answerInstance.typeAnswer == 3) {
                $scope.answerInstance.textAnswer = editor.getMathML();
                $scope.answerInstance.image = null;
            }
            // si es imagen
            if ($scope.answerInstance.typeAnswer == 1) {
                $scope.answerInstance.textAnswer = null;
            }

            Upload.upload({

                url: 'answer/update',
                method: 'POST',
                data: $scope.answerInstance,
                file: $scope.file,
                fileFormDataName: 'file'

            }).progress(function (evt) {

                console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));

            }).success(function (data, status, headers, config) {

                $location.path("/answer/show/" + $scope.answerInstance.id);
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

function AnswerShowController($scope, $location, $rootScope, $routeParams, $templateCache, Answer, Question) {
    $rootScope.location = $location.path();
    /*
    $rootScope.$on('$viewContentLoaded', function () {
        $templateCache.removeAll();

    });
    */



        $scope.answerInstance = Answer.get({id: $routeParams.id}, function (data) {

            document.getElementById('html').innerHTML = data.textAnswer;
            document.getElementById('text').innerHTML = data.questionName;

            $scope.answerInstance = data;

            $scope.question = Question.get({id: $scope.answerInstance.question.id}, function (data) {

                $scope.question = data;

                /*
                 var head = document.getElementsByTagName("head")[0], script;
                 script = document.createElement("script");
                 script.type = "text/x-mathjax-config";
                 script[(window.opera ? "innerHTML" : "text")] =
                 "MathJax.Hub.Config({\n" +
                 "  tex2jax: { inlineMath: [['$','$'], ['\\\\(','\\\\)']] }\n" +
                 "});"
                 head.appendChild(script);
                 script = document.createElement("script");
                 script.type = "text/javascript";
                 script.src = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
                 head.appendChild(script);
                */

            });
        }, function (err) {
            $location.path('/');
        });



    $scope.delete = function () {
        $scope.answerInstance.$delete({id: $routeParams.id}, function (data) {
            $rootScope.message = data.message;
            $location.path('/answer/');
        }, function (error) {
            $scope.messageQuestion = error.data.message;
        });
    };


};
