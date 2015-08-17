package com.ed.classroomcourse

import com.ed.schoolmanagement.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class ClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Class.list([max: params.int('max')]) as JSON
    }

    def getClassByClassroom(Long id) {
        render Class.findAllByClassroom(Classroom.findById(id)) as JSON
    }

    def saveStudents(Integer id) {
        List<Integer> listStudents = request.JSON.students
        Class c = Class.findById(id)
        UserClass.executeUpdate("delete UserClass uc where uc.clazz = :clazz", [clazz: c])
        UserClass uc = null
        for (int i = 0; i < listStudents.size(); i = i + 1) {
            uc = new UserClass()
            uc.clazz = c
            uc.user = User.findById(listStudents[i])
            uc.save(flush: true)
        }
        response.status = 200
        render([message: message(code: "de.userclass.update", args: [c.getName()])] as JSON)
    }

}
