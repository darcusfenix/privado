/**
 * Created by alberto on 3/07/15.
 */
var app = angular.module('ControlEscuela', ['ngRoute', 'angular-loading-bar']);
app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/', {
        controller: 'MainController',
        templateUrl: 'views/main/index.gsp'
    }).otherwise({
        redirectTo: '/'
    });
}]);
/*
 when('/vehiculo/', {
 controller: 'vehiculoListController',
 templateUrl: './views/vehiculo/index.gsp'
 }).when('/vehiculo/create', {
 controller: 'vehiculoCreateController',
 templateUrl: './views/vehiculo/create.html'
 }).when('/vehiculo/edit/:idVehiculo', {
 controller: 'vehiculoEditController',
 templateUrl: './views/vehiculo/edit.gsp'
 }).when('/vehiculo/show/:idVehiculo', {
 controller: 'vehiculoShowController',
 templateUrl: './views/vehiculo/show.gsp'
 }).when('/importar/', {
 templateUrl: './views/importacion/importacion.html'
 }).when('/exportar/', {
 controller: 'vehiculoExportacionPDF',
 templateUrl: './views/exportacionPDF/index.gsp'
 })
 * */
