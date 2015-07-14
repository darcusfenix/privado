/**
 * Created by darcusfenix on 7/13/15.
 */

angular.module('ControlEscuela').factory('StateVoucher', function ($resource) {
    return $resource('stateVoucher/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'stateVoucher/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'stateVoucher/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'stateVoucher/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'stateVoucher/create/'
        },
        save: {
            method: 'POST',
            url: 'stateVoucher/save'
        }
    });
});