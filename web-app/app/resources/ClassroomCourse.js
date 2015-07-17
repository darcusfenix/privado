/**
 * Created by darcusfenix on 17/07/15.
 */


angular.module('ControlEscuela').factory('ClassroomCourse', function ($resource) {
    return $resource('classroomCourse/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'classroomCourse/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'classroomCourse/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'classroomCourse/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'classroomCourse/create/'
        },
        save: {
            method: 'POST',
            url: 'classroomCourse/save'
        }
    });
});