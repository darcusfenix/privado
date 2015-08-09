/**
 * Created by alberto on 24/07/15.
 */
angular.module('Registro').controller('CorreoController', ['$scope', function ($scope) {
    $("#content").removeClass("ocultar");
    $scope.message = "Se te enviará un correo a la brevedad ¡Checálo!. Los correos que se ten envían puede tardar (minutos) dependiendo tu conexión a internet. También es muy importante que revises tu entrada de spam. En algunos casos pueden estar los correos ahí.";
}]);