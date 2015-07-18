package com.service

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import com.ed.service.OnlineCourse
import grails.converters.JSON

class OnlineCourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render( OnlineCourse.list() as JSON)
    }

    def show (Integer id){
        render( OnlineCourse.findById(id ?: params.int("id") ) as JSON )
    }
    def create (){
        render new OnlineCourse() as JSON
    }
    def update (){
        OnlineCourse onlineCourseInstance = OnlineCourse.findById(request.JSON.id)
        onlineCourseInstance.properties = request.JSON

        List<StudentService> lista = new ArrayList<StudentService>();

        StudentService.findAllByService(onlineCourseInstance) { das ->
            StudentService studentServiceAux = new StudentService()
            studentServiceAux.service = onlineCourseInstance
            studentServiceAux.user = User.findById(das.user.id)
            studentServiceAux.active = das.active
            studentServiceAux.fullPayment = das.fullPayment
            lista.add(studentServiceAux)
        }


        if (onlineCourseInstance.validate()) {
            onlineCourseInstance.studentService = null
            onlineCourseInstance.save(flush: true)
            //StudentService.executeUpdate("delete StudentService ss where ss.service = :service", [service: classroomCourseInstance])
            lista.each { studentService ->
                studentService.save(flush: true)
            }
            response.status = 200
            render([onlineCourseInstance: onlineCourseInstance, message: message(code: "onlineCourse.updated")] as JSON)
        }else{
            response.status = 500
            render(onlineCourseInstance.errors as JSON)
        }
    }
}
