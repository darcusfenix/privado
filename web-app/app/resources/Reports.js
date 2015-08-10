/**
 * Created by darcusfenix on 9/08/15.
 */


angular.module('ControlEscuela').factory('Reports', function ($resource) {
    return $resource('reports/:id', {id: '@id'}, {

        getStudentsServicesPaid:{
            method: 'POST',
            isArray: true,
            url: 'reports/getStudentsServicesPaid'
        }
    });
});