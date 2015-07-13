package com.controlescuela

import com.ed.paycontrol.StateVoucher
import com.ed.service.Service
import grails.converters.JSON

class StateVoucherController {

    def index() {}

    def show(Integer id){
        render (StateVoucher.findById(id ?: params.int("id")) as JSON)
    }

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
