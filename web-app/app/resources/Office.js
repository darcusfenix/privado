/**
 * Created by fernandotapia on 7/16/15.
 */

angular.module('ControlEscuela').factory('Office', function ($resource) {
    return $resource('office/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'office/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'office/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'office/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'office/create/'
        },
        save: {
            method: 'POST',
            url: 'office/save'
        }
    });
});