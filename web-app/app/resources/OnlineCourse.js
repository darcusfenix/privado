/**
 * Created by darcusfenix on 17/07/15.
 */

angular.module('ControlEscuela').factory('OnlineCourse', function ($resource) {
    return $resource('onlineCourse/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'onlineCourse/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'onlineCourse/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'onlineCourse/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'onlineCourse/create/'
        },
        save: {
            method: 'POST',
            url: 'onlineCourse/save'
        }
    });
});