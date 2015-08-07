/**
 * Created by alberto on 24/07/15.
 */

var registro = angular.module('Registro', ['ngRoute', 'ngResource']);
registro.config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/', {
        controller: 'RegistroController',
        templateUrl: 'app/views/registro.gsp'

    }).when('/correo', {

        controller: 'CorreoController',
        templateUrl: 'app/views/correo.gsp'

    }).when('/activation/:token', {

        controller: 'ActivationController',
        templateUrl: 'app/views/activacion.gsp'

    }).when('/classConfirmation/:token', { // TODO change the controller

        controller: 'ClassConfirmationController',
        templateUrl: 'app/views/croquis.gsp'

    }).when('/cantAssistOptions/:token', { // TODO change the controller

        controller: 'ActivationController',
        templateUrl: 'app/views/PreparacionOpciones.gsp'

    }).when('/scheduleIssue/:token', { // TODO change the controller

        controller: 'ScheduleIssueController',
        templateUrl: 'app/views/paso31.gsp'

    }).when('/foreignStudent/:token', { // TODO change the controller

        controller: 'foreignStudentController',
        templateUrl: 'app/views/paso32.gsp'

    }).when('/cantPay/:token', { // TODO change the controller

        controller: 'ActivationController',
        templateUrl: 'app/views/paso33.gsp'

    }).otherwise({
        redirectTo: '/'
    });
}]);