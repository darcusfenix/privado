/**
 * Created by darcusfenix on 7/11/15.
 */


angular.module('ControlEscuela').factory('StudentService', function ($resource) {
    return $resource('StudentService/:id', {id: '@id'}, {
        services:{
            method : 'GET',
            isArray:true,
            url: 'StudentService/getServicesOfStudent/'
        },
        getOneServiceOfStudent:{
            method: 'GET',
            url: 'StudentService/getOneServiceOfStudent/'
        }
    });
});