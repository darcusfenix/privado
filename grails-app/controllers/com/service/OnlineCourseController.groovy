package com.service

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import com.ed.service.OnlineCourse
import grails.converters.JSON

import java.text.SimpleDateFormat

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

    def save (){
        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def onlineCourseInstance = new OnlineCourse()
        def jsonMap = [:]
        jsonMap = request.JSON
        Date stDate = sdf.parse(request.JSON.stDate)
        Date endDate = sdf.parse(request.JSON.endDate)
        onlineCourseInstance.stDate = stDate
        onlineCourseInstance.endDate = endDate
        jsonMap.remove('stDate')
        jsonMap.remove('endDate')
        onlineCourseInstance.properties = jsonMap

        if (onlineCourseInstance.validate()) {

            onlineCourseInstance.save(flush: true)
            response.status = 200
            render([onlineCourseInstance: onlineCourseInstance, message: message(code: "onlineCourse.created")] as JSON)

        } else {
            response.status = 500
            render(onlineCourseInstance.errors as JSON)
        }
    }

    def update (){


        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def onlineCourseInstance = OnlineCourse.findById(request.JSON.id)
        def jsonMap = [:]

        jsonMap = request.JSON

        Date stDate = sdf.parse(request.JSON.stDate)
        Date endDate = sdf.parse(request.JSON.endDate)

        onlineCourseInstance.stDate = stDate
        onlineCourseInstance.endDate = endDate

        jsonMap.remove('stDate')
        jsonMap.remove('endDate')

        onlineCourseInstance.properties = jsonMap


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
