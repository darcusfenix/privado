/**
 * Created by darcusfenix on 8/07/15.
 */

angular.module('ControlEscuela').factory('VoucherPayment', function ($resource) {
    return $resource('voucherPayment/:id', {id: '@id'}, {

        get: {
            method: 'GET',
            url: 'voucherPayment/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'voucherPayment/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'voucherPayment/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'voucherPayment/create'
        },
        save: {
            method: 'POST',
            url: 'voucherPayment/save'
        }
    });
});