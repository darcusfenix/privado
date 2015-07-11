package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.paycontrol.StateVoucher
import com.ed.service.Service
import com.ed.service.TypeService
import grails.converters.JSON
import org.apache.tools.ant.types.resources.comparators.Date
import org.grails.datastore.mapping.query.api.Criteria
import org.h2.util.StatementBuilder

class VoucherPaymentController {

    static allowedMethods = [save: "POST", create: "GET"]

    def index() { }

    def create() {
        render new VoucherPayment() as JSON
    }

    def save(VoucherPayment voucherPaymentInstance) {




        User otroU = User.findById(1)

        Service otroS = Service.findById(1)

        //StudentService studentService = StudentService.find("from StudentService where user=:user and service=:service", [user : otroU, service: otroS])
        StudentService studentService = StudentService.findByUserAndService(otroU, otroS)

        voucherPaymentInstance.studentService = studentService
        voucherPaymentInstance.stateId = 1
        voucherPaymentInstance.image = null
        voucherPaymentInstance.payDate = new java.util.Date()
        voucherPaymentInstance.stateVoucher = StateVoucher.findById(1)

        if (voucherPaymentInstance.save(flush: true, failOnError: true)) {
            response.status = 200
            render voucherPaymentInstance as JSON
        }
        else {
            response.status = 500
            render voucherPaymentInstance.errors as JSON
        }

    }
}

