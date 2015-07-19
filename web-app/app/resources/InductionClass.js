/**
 * Created by fernandotapia on 7/16/15.
 */

angular.module('ControlEscuela').factory('InductionClass', function ($resource) {
    return $resource('inductionClass/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'inductionClass/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'inductionClass/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'inductionClass/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'inductionClass/create/'
        },
        save: {
            method: 'POST',
            url: 'inductionClass/save'
        }
    });
});