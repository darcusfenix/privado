/**
 * Created by darcusfenix on 7/11/15.
 */

angular.module('ControlEscuela').factory('TypeService', function ($resource) {
    return $resource('typeService/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'typeService/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'typeService/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'typeService/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'typeService/create/'
        },
        save: {
            method: 'POST',
            url: 'typeService/save'
        }
    });
});