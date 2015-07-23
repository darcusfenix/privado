/**
 * By Tapia Mujica Fernando 10/07/15
 */
angular.module('ControlEscuela').factory('Classroom', function ($resource) {
    return $resource('classroom/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'classroom/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'classroom/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'classroom/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'classroom/create/'
        },
        save: {
            method: 'POST',
            url: 'classroom/save'
        },
        getClassroomByOffice: {
            method: 'GET',
            isArray: true,
            url: 'classroom/getClassroomByOffice/:id'
        },
        getNumberClassRoom: {
            method: 'GET',
            url: 'classroom/getNumberClassRoom/'
        }
    });
});