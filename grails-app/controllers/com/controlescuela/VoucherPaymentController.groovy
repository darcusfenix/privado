package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.paycontrol.StateVoucher
import com.ed.schoolmanagement.User
import com.ed.service.Service
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class VoucherPaymentController {

    static allowedMethods = [save: "POST", create: "GET", saveSingleVourcherPayment: "POST", disableServices: "POST"]

    def index() {}

    def create() {
        render new VoucherPayment() as JSON
    }


    def vouchersPaymentStudentAndService() {

        render VoucherPayment.findAllByStudentService(StudentService.findByUserAndService(User.findById(params.int("userId")), Service.findById(params.int("serviceId")))) as JSON
    }

    def saveSingleVourcherPayment(VoucherPayment voucherPaymentInstance) {
        float pago = params.getFloat("pay");
        if (pago == null && pago <= 0) {
            response.status = 500
            render([message: message(code: "voucherPayment.pay.error")] as JSON)
            return 0;
        }

        Float totalPaid = 0.0
        Float totalRequired = 0.0
        Float subtraction = 0.0

        StudentService.findAllByUser(User.findById(params.int("userId"))).each { StudentService ->
            Service.findAllById(StudentService.service.id).each { service ->
                totalRequired += service.cost
            }
            VoucherPayment.findAllByStudentService(StudentService).each { voucherPayment ->
                totalPaid += voucherPayment.pay
            }
        }

        if (totalPaid < totalRequired) {
            subtraction = totalRequired - totalPaid
            if (pago <= subtraction) {
                log.error("dskmm")
            } else {
                response.status = 500
                render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
                return;
            }
        } else {
            response.status = 500
            render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
            return;
        }

        StudentService.findAllByUser(User.findById(params.int("userId"))).each { studentServicioIndividual ->
            Float costo = Service.findById(studentServicioIndividual.service.id).cost
            Float totalPaidServicio = 0.0

            VoucherPayment.findAllByStudentService(studentServicioIndividual).each { voucherPaymentIndividual ->
                totalPaidServicio += voucherPaymentIndividual.pay
            }
            log.error("*******************" + totalPaidServicio)
            log.error("**********************" + totalPaid)
            if (totalPaidServicio < costo) { // si lo que está pagado es menor al costo,entonces debo pagar
                float aPagar = costo - totalPaidServicio; // entonces tengo que pagar
                float saldo = pago - aPagar; // mi saldo sería
                if (aPagar <= pago) {
                    // entonces si lo que voy a pagar es menor o igual a mi saldo. PUEDO PAGAR COMPLETO?
                    VoucherPayment voucherPayment = new VoucherPayment()
                    voucherPayment.studentService = studentServicioIndividual
                    voucherPayment.pay = aPagar
                    voucherPayment.payDate = new java.util.Date()
                    voucherPayment.stateVoucher = StateVoucher.findById(params.int("stateVoucher"))
                    if (voucherPayment.save(flush: true)) {
                        pago = pago - voucherPayment.pay;
                    } else {
                        log.error(voucherPayment.errors)
                    }
                } else {
                    float soloPuedoPagar = aPagar - pago;
                    if (pago > 0) {

                        VoucherPayment voucherPayment = new VoucherPayment()
                        voucherPayment.studentService = studentServicioIndividual
                        voucherPayment.pay = pago;
                        voucherPayment.payDate = new java.util.Date()
                        voucherPayment.stateVoucher = StateVoucher.findById(params.int("stateVoucher"))
                        if (voucherPayment.save(flush: true)) {
                            pago = pago - voucherPayment.pay;
                        } else {
                            log.error(voucherPayment.errors)
                        }
                    }
                }

            } else {
                log.error(costo)
            }
        }
        response.status = 200
        render([message: message(code: "voucherPayment.pay.success")] as JSON)


    }

    def save(VoucherPayment voucherPaymentInstance) {
        StudentService studentService = StudentService.findByUserAndService(User.findById(params.int("userId")), Service.findById(params.int("serviceId")))
        Float totalPaid = 0.0
        Float totalRequired = 0.0
        Float subtraction = 0.0

        StudentService.findAllByUser(User.findById(params.int("userId"))).each { StudentService ->
            Service.findAllById(StudentService.service.id).each { service ->
                totalRequired += service.cost
            }
            VoucherPayment.findAllByStudentService(StudentService).each { voucherPayment ->
                totalPaid += voucherPayment.pay
            }
        }

        if (totalPaid < totalRequired) {
            subtraction = totalRequired - totalPaid
            if (voucherPaymentInstance.pay <= subtraction) {

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
            } else {
                response.status = 500
                render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
            }
        } else {
            response.status = 500
            render([message: message(code: "voucherPayment.pay.exceded")] as JSON)
        }
    }

    def disableServices() {

        def service = Service.findById(params.int("id"))
        //Float totalRequired = 0.0
        //Float totalPaid = 0.0

        StudentService.findAllByService(service).each { studentService ->

            Float totalPaidService = 0.0
            /*
            Service.findAllById(StudentService.service.id).each { varService ->
                totalRequired += varService.cost
            }*/

            VoucherPayment.findAllByStudentService(studentService).each { voucherPayment ->
                totalPaidService += voucherPayment.pay
                //totalPaid += voucherPayment.pay
            }

            if (totalPaidService == service.cost) {

                log.error("********************" + "SE HA PAGADO")
            } else {

                studentService.active = false;
                studentService.save(flush: true)

                log.error("********************" + "NO SE HA PAGADO")
            }
        }
        response.status = 200
        render([message: message(code: "se han realizado los cambios")] as JSON)
    }
}

