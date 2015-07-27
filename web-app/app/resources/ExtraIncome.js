/**
 * Created by darcusfenix on 25/07/15.
 */

angular.module('ControlEscuela').factory('ExtraIncome', function ($resource) {
    return $resource('ExtraIncome/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'extraIncome/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'extraIncome/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'extraIncome/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'extraIncome/create/'
        },
        save: {
            method: 'POST',
            url: 'extraIncome/save'
        }
    });
});