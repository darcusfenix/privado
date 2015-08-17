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

    var editor;
    editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en', 'toolbar': '<toolbar ref="chemistry"/>'});
    editor.insertInto(document.getElementById('editorContainer'));

    $scope.varEditor = undefined;
    $scope.typeQuestion = 1;
    $scope.varEditorMessage = undefined;

    var editorNull = '<math xmlns="http://www.w3.org/1998/Math/MathML"/>';

    $(".wrs_linkButton").remove();
    $(".wrs_imageContainer").remove();

    ComponentsEditors.init();

    $scope.removeText = function () {
        $('#summernote_1').code(" ");
    };


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
        if($scope.typeQuestion === 2){
            $scope.varEditor = editor.getMathML();
        }
        else if ($scope.typeQuestion === 1){
            $scope.varEditor = $('#summernote_1').code();
            console.log($scope.varEditor);
        }
        if (valid) {
            if ($scope.varEditor != editorNull) {
                $scope.varEditorMessage = undefined;
                $scope.questionInstance.text = $scope.varEditor;
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
                $scope.varEditorMessage = "El campo pregunta es obligatorio para realizar el registro";
            }
        } else {
            return false;
        }

    };
};


function QuestionEditController($scope, $location, $routeParams, $rootScope, Section, Question, Upload) {
    $rootScope.location = $location.path();
    $scope.validator = {};
    $scope.typeQuestion = 1;
    ComponentsEditors.init();

    $scope.varEditor = undefined;
    $scope.varEditorMessage = undefined;
    var editorNull = '<math xmlns="http://www.w3.org/1998/Math/MathML"/>';

    var dirtyForm = null;
    var editor;
    editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en', 'toolbar': '<toolbar ref="chemistry"/>'});
    editor.insertInto(document.getElementById('editorContainer'));

    $(".wrs_linkButton").remove();
    $(".wrs_imageContainer").remove();

    setInterval(function () {
        if ($scope.varEditor != editor.getMathML() && dirtyForm == null) {
            $scope.updateQuestion.$dirty = true;
            dirtyForm = true;
            $scope.$apply();
        }
    }, 1000);

    $scope.sectionList = Section.query(function (data) {
        $scope.questionInstance = Question.get({id: $routeParams.id}, function (data) {
            $scope.questionInstance = data;
            $scope.varSlc = data.section.id;
            $scope.varEditor = data.text;
            editor.setMathML(data.text);
            $('#summernote_1').code(data.text);
        }, function (err) {
            $location.path('/');
        });
    });

    $scope.removeText = function () {
        $('#summernote_1').code(" ");
    };

    $scope.editQuestion = function editQuestion(valid, $event) {
        $event.preventDefault();
        if($scope.typeQuestion === 2){
            $scope.varEditor = editor.getMathML();
        }
        else if ($scope.typeQuestion === 1){
            $scope.varEditor = $('#summernote_1').code();
            console.log($scope.varEditor);
        }

        if (valid) {
            if ($scope.varEditor != editorNull) {
                $scope.varEditorMessage = undefined;
                $scope.questionInstance.text = $scope.varEditor;
                var f = $scope.file;
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
                $scope.varEditorMessage = "El campo pregunta es obligatorio para realizar el registro";
            }
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

    $scope.questionInstance = Question.get({id: $routeParams.id}, function (data) {
        console.log($scope.questionInstance);
        $("#textHTML").html(data.text);

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
    });

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