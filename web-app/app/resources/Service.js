/**
 * Created by darcusfenix on 7/11/15.
 */

angular.module('ControlEscuela').factory('Service', function ($resource) {
    return $resource('service/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'service/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'service/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'service/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'service/create/'
        },
        save: {
            method: 'POST',
            url: 'service/save'
        },
        getTotalRequiredByUser:{
            method: 'GET',
            isArray: false,
            url: 'service/getTotalRequiredByUser/:userId'
        },
        getServicesByStateTrue:{
            method: 'GET',
            isArray: true,
            url: 'service/getServicesByStateTrue/'
        }
    });
});