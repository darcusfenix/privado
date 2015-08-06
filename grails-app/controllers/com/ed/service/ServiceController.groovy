package com.ed.service

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.schoolmanagement.User
import com.ed.service.Service
import grails.converters.JSON

class ServiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render Service.list() as JSON
    }


    def show(Integer id){
        render (Service.findById(id ?: params.int("id")) as JSON)
    }

    def getTotalRequiredByUser(Integer userId) {

        Float totalRequired = 0.0

        StudentService.findAllByUser(User.findById(userId ?: params.int("id"))).each { StudentService ->
            Service.findAllById(StudentService.service.id).each { service ->
                totalRequired += service.cost
            }
        }

        def mapa = [ total : totalRequired]

        render mapa as JSON

    }

    def save() {
        def serviceInstance = new Service(request.JSON)
        log.error(request.JSON)
        log.error(serviceInstance.validate())
        if (serviceInstance.validate()) {
            log.error("IS VALID");
            serviceInstance.save()
            TypeService.create(serviceInstance, TypeService.findById(request.JSON.authority.id), true)
            response.status = 200
            render([service: serviceInstance, message: message(code: "de.service.created.message")] as JSON)
        } else {
            response.status = 500
            log.error("ERROR")
            log.error(serviceInstance.errors)
            log.error("ERROR")
            render(serviceInstance.errors as JSON)
        }
    }

}
