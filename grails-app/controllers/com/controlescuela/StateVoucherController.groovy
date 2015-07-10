package com.ed.paycontrol

import grails.converters.JSON

class StateVoucherController {

    def index() {}

    def save(StateVoucher stateVoucherInstance) {
        if (stateVoucherInstance.save(flush: true, failOnError: true)) {
            response.status = 200
            render stateVoucherInstance as JSON
        } else {
            response.status = 500
            render stateVoucherInstance.errors as JSON
        }
    }
}
