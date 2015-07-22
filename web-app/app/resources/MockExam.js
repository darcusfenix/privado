/**
 * Created by darcusfenix on 17/07/15.
 */

angular.module('ControlEscuela').factory('MockExam', function ($resource) {
    return $resource('mockExam/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'mockExam/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'mockExam/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'mockExam/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'mockExam/create/'
        },
        save: {
            method: 'POST',
            url: 'mockExam/save'
        }
    });
});