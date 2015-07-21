package com.service

import com.ed.accesscontrol.StudentService
import com.ed.schoolmanagement.User
import com.ed.service.MockExam
import grails.converters.JSON

import java.text.SimpleDateFormat

class MockExamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render(MockExam.list() as JSON )
    }

    def show(Integer id){
        render ( MockExam.findById(id ?: params.int("id")) as JSON )
    }
    def create(){
        render (new MockExam() as JSON)
    }
    def save(){
        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def mockExamInstance = new MockExam()
        def jsonMap = [:]
        jsonMap = request.JSON
        Date stDate = sdf.parse(request.JSON.stDate)
        Date endDate = sdf.parse(request.JSON.endDate)
        mockExamInstance.stDate = stDate
        mockExamInstance.endDate = endDate
        jsonMap.remove('stDate')
        jsonMap.remove('endDate')
        mockExamInstance.properties = jsonMap


        if (mockExamInstance.validate()) {

            mockExamInstance.save(flush: true)
            response.status = 200
            render([mockExamInstance: mockExamInstance, message: message(code: "mockExam.created")] as JSON)

        } else {
            response.status = 500
            render(mockExamInstance.errors as JSON)
        }
    }
    def update(){
        /*
        MockExam mockExamInstance = MockExam.findById(request.JSON.id)
        mockExamInstance.properties = request.JSON
        */

        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
        def mockExamInstance = MockExam.findById(request.JSON.id)
        def jsonMap = [:]

        jsonMap = request.JSON

        Date stDate = sdf.parse(request.JSON.stDate)
        Date endDate = sdf.parse(request.JSON.endDate)

        mockExamInstance.stDate = stDate
        mockExamInstance.endDate = endDate

        jsonMap.remove('stDate')
        jsonMap.remove('endDate')

        mockExamInstance.properties = jsonMap

        List<StudentService> lista = new ArrayList<StudentService>();

        StudentService.findAllByService(mockExamInstance) { das ->
            StudentService studentServiceAux = new StudentService()
            studentServiceAux.service = mockExamInstance
            studentServiceAux.user = User.findById(das.user.id)
            studentServiceAux.active = das.active
            studentServiceAux.fullPayment = das.fullPayment
            lista.add(studentServiceAux)
        }


        if (mockExamInstance.validate()) {
            mockExamInstance.studentService = null
            mockExamInstance.save(flush: true)
            //StudentService.executeUpdate("delete StudentService ss where ss.service = :service", [service: classroomCourseInstance])
            lista.each { studentService ->
                studentService.save(flush: true)
            }
            response.status = 200
            render([mockExamInstance: mockExamInstance, message: message(code: "mockExam.updated")] as JSON)
        }else{
            response.status = 500
            render(mockExamInstance.errors as JSON)
        }
    }
    def delete(){

    }
}
