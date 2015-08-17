package com.ed.service

import com.ed.classroomcourse.Classroom
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class OfficeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Office.list([max: params.int('max')]) as JSON
    }

    def show(Integer id) {
        render(Office.findById(id ?: params.int("id")) as JSON)
    }

    def create(){
        render (new Office() as JSON)
    }

    def save(){
        Office officeInstance = new Office(request.JSON)
        if(officeInstance.validate()){
            officeInstance.save(flush: true)
            response.status = 200;
            render([office: officeInstance, message: message(code: "de.office.created.message")] as JSON)
        }else{
            response.status = 500;
            render(officeInstance.errors as JSON)
        }
    }

    def delete(Integer id) {
        def officeInstance = Office.findById(id ?: params.int("id"))
        if(Classroom.findByOffice(officeInstance) == null) {
            officeInstance.delete(flush: true)
            response.status = 200
            render([message: message(code: 'de.office.deleted.message')] as JSON)
        }else{
            response.status = 500
            render([message: message(code: 'de.office.classroom', args: [officeInstance.name] )] as JSON)
        }
    }

    def edit(Integer id){
        render(Office.findById(id ?: params.int("id")) as JSON)
    }

    def update(){
        Office officeInstance = Office.findById(request.JSON.id)
        officeInstance.properties = request.JSON

        if(officeInstance.validate()){
            officeInstance.save(flush: true)
            response.status = 200;
            render([office: officeInstance, message: message(code: "de.office.updated.message")] as JSON)
        }else{
            response.status = 500;
            render(officeInstance.errors as JSON)
        }
    }

}
