package com.service

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import com.ed.service.ClassroomCourse
import com.ed.service.TypeCourse
import com.ed.service.TypeService
import grails.converters.JSON

import java.text.SimpleDateFormat

class ClassroomCourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render (ClassroomCourse.list() as JSON)
    }
    def show(Integer id){
        render( ClassroomCourse.findById(id ?: params.int("id")) as JSON)
    }

    def create(){
        render new ClassroomCourse() as JSON
    }

    def save(){
        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def classroomCourseInstance = new ClassroomCourse(request.JSON)

        //classroomCourseInstance.stDate = new Date().parse("dd/MM/yyyy", request.JSON.stDate)
        //classroomCourseInstance.endDate = new Date().parse("dd/MM/yyyy", request.JSON.stDate)

        if (classroomCourseInstance.validate()) {

            classroomCourseInstance.save(flush: true)
            response.status = 200
            render([classroomCourseInstance: classroomCourseInstance, message: message(code: "classroomCourse.created")] as JSON)

        } else {
            response.status = 500
            render(classroomCourseInstance.errors as JSON)
        }

    }
    def update(){

        ClassroomCourse classroomCourseInstance = ClassroomCourse.findById(request.JSON.id)
        classroomCourseInstance.properties = request.JSON

        List<StudentService> lista = new ArrayList<StudentService>();

        StudentService.findAllByService(classroomCourseInstance) { das ->
            StudentService studentServiceAux = new StudentService()
            studentServiceAux.service = classroomCourseInstance
            studentServiceAux.user = User.findById(das.user.id)
            studentServiceAux.active = das.active
            studentServiceAux.fullPayment = das.fullPayment
            lista.add(studentServiceAux)
        }


        if (classroomCourseInstance.validate()) {
            classroomCourseInstance.studentService = null
            classroomCourseInstance.save(flush: true)
            //StudentService.executeUpdate("delete StudentService ss where ss.service = :service", [service: classroomCourseInstance])
            lista.each { studentService ->
                studentService.save(flush: true)
            }
            response.status = 200
            render([classroomCourseInstance: classroomCourseInstance, message: message(code: "classroomCourse.updated")] as JSON)
        }else{
            response.status = 500
            render(classroomCourseInstance.errors as JSON)
        }

    }
    def delete(){

    }
}
