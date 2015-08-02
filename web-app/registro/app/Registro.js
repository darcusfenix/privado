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

    }).when('/activacion', {

        controller: 'ActivationController',
        templateUrl: 'app/views/activacion.gsp'

    }).when('/classConfirmation', {

        controller: 'ActivationController',
        templateUrl: 'app/views/croquis.gsp'

    }).when('/cantAssistOption', {

        controller: 'ActivationController',
        templateUrl: 'app/views/activacion.gsp'

    }).otherwise({
        redirectTo: '/'
    });
}]);