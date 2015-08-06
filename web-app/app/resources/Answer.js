/**
 * Created by darcusfenix on 30/07/15.
 */

angular.module('ControlEscuela').factory('Answer', function ($resource) {
    return $resource('answer/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'answer/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'answer/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'answer/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'answer/create/'
        },
        save: {
            method: 'POST',
            url: 'answer/save'
        }
    });
});