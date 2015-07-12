package com.controlescuela

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import grails.converters.JSON

class StudentServiceController {

    def index() {}

    def getServicesOfStudent() {

        render ( StudentService.findAllByUser(User.findAllById(params.int("userId")))  as JSON)

    }
}
