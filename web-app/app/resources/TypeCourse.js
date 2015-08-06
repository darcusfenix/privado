/**
 * Created by darcusfenix on 16/07/15.
 */

angular.module('ControlEscuela').factory('TypeCourse', function ($resource) {
    return $resource('typeCourse/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'typeCourse/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'typeCourse/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'typeCourse/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'typeCourse/create/'
        },
        save: {
            method: 'POST',
            url: 'typeCourse/save'
        }
    });
});