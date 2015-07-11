package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.paycontrol.StateVoucher
import com.ed.schoolmanagement.User
import com.ed.service.Service
import grails.converters.JSON

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
        voucherPaymentInstance.id = 1
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

