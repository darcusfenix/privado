package com.service

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import com.ed.service.ExtraService
import com.ed.service.MockExam
import com.ed.service.OnlineCourse
import grails.converters.JSON

import java.text.SimpleDateFormat

class ExtraServiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render (ExtraService.list() as JSON )
    }

    def create(){
        render(new ExtraService() as JSON)
    }

    def show (Integer id){
        render(ExtraService.findById(id ?: params.int("id") ) as JSON)
    }

    def update(){
        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def extraServiceInstance = ExtraService.findById(request.JSON.id)
        def jsonMap = [:]

        jsonMap = request.JSON

        Date stDate = sdf.parse(request.JSON.stDate)
        Date endDate = sdf.parse(request.JSON.endDate)

        extraServiceInstance.stDate = stDate
        extraServiceInstance.endDate = endDate

        jsonMap.remove('stDate')
        jsonMap.remove('endDate')

        extraServiceInstance.properties = jsonMap


        List<StudentService> lista = new ArrayList<StudentService>();

        StudentService.findAllByService(extraServiceInstance) { das ->
            StudentService studentServiceAux = new StudentService()
            studentServiceAux.service = extraServiceInstance
            studentServiceAux.user = User.findById(das.user.id)
            studentServiceAux.active = das.active
            studentServiceAux.fullPayment = das.fullPayment
            lista.add(studentServiceAux)
        }


        if (extraServiceInstance.validate()) {
            extraServiceInstance.studentService = null
            extraServiceInstance.save(flush: true)
            //StudentService.executeUpdate("delete StudentService ss where ss.service = :service", [service: classroomCourseInstance])

            lista.each { studentService ->
                studentService.save(flush: true)
            }

            response.status = 200
            render([extraServiceInstance: extraServiceInstance, message: message(code: "extraService.updated")] as JSON)
        }else{
            response.status = 500
            render(extraServiceInstance.errors as JSON)
        }
    }

    def save (){
        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def extraServiceInstance = new ExtraService()
        def jsonMap = [:]
        jsonMap = request.JSON

        Date stDate = sdf.parse(request.JSON.stDate)
        Date endDate = sdf.parse(request.JSON.endDate)

        extraServiceInstance.stDate = stDate
        extraServiceInstance.endDate = endDate
        extraServiceInstance.fullIncome = 0

        jsonMap.remove('stDate')
        jsonMap.remove('endDate')
        jsonMap.remove('fullIncome')

        extraServiceInstance.properties = jsonMap

        if (extraServiceInstance.validate()) {

            extraServiceInstance.save(flush: true)
            response.status = 200
            render([extraServiceInstance: extraServiceInstance, message: message(code: "extraService.created")] as JSON)

        } else {
            response.status = 500
            render(extraServiceInstance.errors as JSON)
        }
    }

    def delete(){
        ExtraService extraService = ExtraService.findById(params.int("id"))
        if (extraService.studentService.empty && extraService.extraIncome.empty){
            extraService.delete(flush: true)
            response.status = 200
            render([success: message(code: 'extraService.deleted')] as JSON)
        }else{
            response.status = 500
            render([error: message(code: 'extraService.canNotRemove')] as JSON)
        }
    }
}
