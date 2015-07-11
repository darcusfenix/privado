/**
 * Created by alberto on 9/07/15.
 */
/**
 * Created by alberto on 4/07/15.
 */
angular.module('ControlEscuela').factory('Role', function ($resource) {
    return $resource('role/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'role/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'role/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'role/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'role/create/'
        },
        save: {
            method: 'POST',
            url: 'role/save'
        }
    });
});
