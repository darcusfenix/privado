package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import grails.converters.JSON


//@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class StudentServiceController {

    def index() {}

    def getServicesOfStudent() {
        render ( StudentService.findAllByUser(User.findAllById(params.int("userId")))  as JSON)
    }
    def getOneServiceOfStudent() {
        render ( StudentService.findByUser(User.findById(params.int("userId")))  as JSON)
    }
}
