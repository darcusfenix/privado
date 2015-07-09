package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.paycontrol.StateVoucher
import com.ed.service.Service
import grails.converters.JSON
import org.apache.tools.ant.types.resources.comparators.Date

class VoucherPaymentController {

    static allowedMethods = [save: "POST", create: "GET"]

    def index() { }

    def create() {
        render new VoucherPayment() as JSON
    }

    def save(VoucherPayment voucherPaymentInstance) {


        User user = new User()
        user.id = 1

        println(user)

        Service service = new Service()
        service.id = 4

        println(service)

        StateVoucher stateVoucher = new StateVoucher()
        stateVoucher.id = 1

        println(stateVoucher.id + " state voucher")

        StudentService studentService = new StudentService()
        studentService.user = user
        studentService.service = service
        studentService.active = true

        println ("student service --> id_user " + studentService.user.id + " id_service: " + studentService.service.id)

        voucherPaymentInstance.studentService = studentService
        voucherPaymentInstance.stateId = 1
        voucherPaymentInstance.stateVoucher = stateVoucher



        println("id del voucher " + voucherPaymentInstance.stateVoucher.id)




        if (voucherPaymentInstance.save()) {
            response.status = 200
            render voucherPaymentInstance as JSON
        }
        else {
            response.status = 500
            render voucherPaymentInstance.errors as JSON
        }

    }
}
