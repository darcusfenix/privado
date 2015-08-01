/**
 * Created by darcusfenix on 30/07/15.
 */


angular.module('ControlEscuela').factory('Question', function ($resource) {
    return $resource('question/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'question/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'question/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'question/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'question/create/'
        },
        save: {
            method: 'POST',
            url: 'question/save'
        },
        getBySection:{
            method: 'GET',
            isArray: true,
            url: 'question/getBySection'
        }
    });
});