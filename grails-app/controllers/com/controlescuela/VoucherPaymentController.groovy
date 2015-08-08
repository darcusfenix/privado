package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.paycontrol.StateVoucher
import com.ed.schoolmanagement.User
import com.ed.service.Service
import grails.converters.JSON

class VoucherPaymentController {

    static allowedMethods = [save: "POST", create: "GET", saveSingleVourcherPayment: "POST"]

    def index() {}

    def create() {
        render new VoucherPayment() as JSON
    }


    def vouchersPaymentStudentAndService() {

        render VoucherPayment.findAllByStudentService(StudentService.findByUserAndService(User.findById(params.int("userId")), Service.findById(params.int("serviceId")))) as JSON
    }

    def saveSingleVourcherPayment(VoucherPayment voucherPaymentInstance) {

        if (params.getFloat("pay") == null ){
            response.status = 500
            render([message: message(code: "voucherPayment.pay.error")] as JSON)
            return 0;
        }

        Float totalPaid = 0.0
        Float totalRequired = 0.0
        Float subtraction = 0.0

        StudentService.findAllByUser(User.findById( params.int("userId") )).each { StudentService ->
            Service.findAllById(StudentService.service.id).each { service ->
                totalRequired += service.cost
            }
            VoucherPayment.findAllByStudentService(StudentService).each { voucherPayment ->
                totalPaid += voucherPayment.pay
            }
        }

        if (totalPaid < totalRequired  ){
            subtraction = totalRequired - totalPaid
            if (params.getFloat("pay") <= subtraction){

                voucherPaymentInstance.studentService  = StudentService.findByUser(User.findById( params.int("userId")))
                voucherPaymentInstance.pay = params.getFloat("pay")
                voucherPaymentInstance.payDate = new java.util.Date()
                voucherPaymentInstance.stateVoucher = StateVoucher.findById(params.int("stateVoucher"))

                if (voucherPaymentInstance.save(flush: true, failOnError: true)) {
                    response.status = 200
                    render([message: message(code: "voucherPayment.pay.success")] as JSON)
                } else {
                    response.status = 500
                    render([message: message(code: "voucherPayment.pay.error")] as JSON)
                }
            }else{
                response.status = 500
                render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
            }
        }else{
            response.status = 500
            render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
        }
    }

    def save(VoucherPayment voucherPaymentInstance) {
        StudentService studentService = StudentService.findByUserAndService(User.findById(params.int("userId")), Service.findById(params.int("serviceId")))
        Float totalPaid = 0.0
        Float totalRequired = 0.0
        Float subtraction = 0.0

        StudentService.findAllByUser(User.findById( params.int("userId") )).each { StudentService ->
            Service.findAllById(StudentService.service.id).each { service ->
                totalRequired += service.cost
            }
            VoucherPayment.findAllByStudentService(StudentService).each { voucherPayment ->
                totalPaid += voucherPayment.pay
            }
        }

        if (totalPaid < totalRequired  ){
            subtraction = totalRequired - totalPaid
            if (voucherPaymentInstance.pay <= subtraction){

                voucherPaymentInstance.studentService = studentService
                voucherPaymentInstance.payDate = new java.util.Date()
                voucherPaymentInstance.stateVoucher = StateVoucher.findById(params.int("stateVoucher"))

                if (voucherPaymentInstance.save(flush: true, failOnError: true)) {
                    response.status = 200
                    render([message: message(code: "voucherPayment.pay.success")] as JSON)
                } else {
                    response.status = 500
                    //render voucherPaymentInstance.errors as JSON
                    render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
                }
            }else{
                response.status = 500
                render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
            }
        }else{
            response.status = 500
            render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
        }




    }
}

