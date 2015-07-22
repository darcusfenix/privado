/**
 * By Tapia Mujica Fernando 10/07/15
 */
angular.module('ControlEscuela').factory('Class', function ($resource) {
    return $resource('class/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'class/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'class/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'class/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'class/create/'
        },
        save: {
            method: 'POST',
            url: 'class/save'
        },
        getClassByClassroom: {
            method: 'GET',
            isArray: true,
            url: 'class/getClassByClassroom/:id'
        }
    });
});