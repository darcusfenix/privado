/**
 * By Tapia Mujica Fernando 10/07/15
 */
angular.module('ControlEscuela').factory('StateClassroom', function ($resource) {
    return $resource('stateClassroom/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'stateClassroom/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'stateClassroom/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'stateClassroom/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'stateClassroom/create/'
        },
        save: {
            method: 'POST',
            url: 'stateClassroom/save'
        }
    });
});