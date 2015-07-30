/**
 * Created by darcusfenix on 25/07/15.
 */

angular.module('ControlEscuela').factory('Structure', function ($resource) {
    return $resource('Structure/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'structure/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'structure/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'structure/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'structure/create/'
        },
        save: {
            method: 'POST',
            url: 'structure/save'
        }
    });
});