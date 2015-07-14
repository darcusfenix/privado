package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.VoucherPayment
import com.ed.schoolmanagement.User
import com.ed.service.Service
import grails.converters.JSON

class ServiceController {

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
}
