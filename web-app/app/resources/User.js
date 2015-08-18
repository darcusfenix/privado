/**
 * Created by alberto on 4/07/15.
 */
angular.module('ControlEscuela').factory('User', function ($resource) {
    return $resource('user/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'user/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'user/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'user/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'user/create/'
        },
        save: {
            method: 'POST',
            url: 'user/save'
        },
        sendEmail: {
            method: 'POST',
            url: 'user/sendEmailAddres'
        },
        sendEmailExam: {
            method: 'POST',
            url: 'user/sendEmailExam'
        },
        sendEmailExamToAllStudents: {
            method: 'POST',
            url: 'user/sendEmailExamToAllStudents'
        }
    });
});