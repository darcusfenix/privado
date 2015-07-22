/**
 * Created by darcusfenix on 20/07/15.
 */

angular.module('ControlEscuela').factory('ExtraService', function ($resource) {
    return $resource('extraService/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'extraService/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'extraService/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'extraService/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'extraService/create/'
        },
        save: {
            method: 'POST',
            url: 'extraService/save'
        }
    });
});