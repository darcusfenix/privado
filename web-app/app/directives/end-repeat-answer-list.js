/**
 * Created by darcusfenix on 4/08/15.
 */

angular.module('ControlEscuela').directive('endRepeatAnswerList', function () {

    return function (scope, element, attrs) {

        if (scope.$last) {
            $(".html").each(function(index, element ){
                $(element).html(scope.answerList[index].textAnswer);
            });
        }

    };
});