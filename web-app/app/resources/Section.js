/**
 * Created by darcusfenix on 28/07/15.
 */

angular.module('ControlEscuela').factory('Section', function ($resource) {
    return $resource('section/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'section/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'section/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'section/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'section/create/'
        },
        save: {
            method: 'POST',
            url: 'section/save'
        }
    });
});
