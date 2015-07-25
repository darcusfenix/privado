/**
 * Created by alberto on 24/07/15.
 */

var registro = angular.module('Registro', ['ngRoute', 'ngResource']);
registro.config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/', {
        controller: 'RegistroController',
        templateUrl: 'app/views/registro.gsp'

    }).when('/activate/:token', {

        controller: 'ActivateController',
        templateUrl: 'app/views/activate.gsp'

    }).when('/correo', {

        controller: 'CorreoController',
        templateUrl: 'app/views/correo.gsp'

    }).otherwise({
        redirectTo: '/'
    });
}]);