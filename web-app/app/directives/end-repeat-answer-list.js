/**
 * Created by darcusfenix on 4/08/15.
 */

angular.module('ControlEscuela').directive('endRepeatAnswerList', function () {

    return function (scope, element, attrs) {

        if (scope.$last) {
            $(".html").each(function(index, element ){
                $(element).html(scope.answerList[index].textAnswer);
            });
            $(".text").each(function(index, element ){
                $(element).html(scope.answerList[index].questionName);
            });

        }

    };
});
angular.module('ControlEscuela').directive('endRepeatQuestionAnswerList', function () {

    return function (scope, element, attrs) {

        if (scope.$last) {
            $(".html").each(function(index, element ){
                $(element).html(scope.questionInstance.answer[index].textAnswer);
            });
        }

    };
});