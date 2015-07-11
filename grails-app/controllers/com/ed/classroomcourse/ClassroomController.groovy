package com.ed.classroomcourse

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassroomController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Classroom.list([max: params.int('max')]) as JSON
    }

    def show(Classroom classroomInstance) {
        respond classroomInstance
    }

    def create() {
        respond new Classroom(params)
    }

    @Transactional
    def save(String json) {
        print(request.JSON)
        //print(id)
//        if (classroomInstance.save(flush: true, failOnError: true)) {
//            response.status = 200
//            render classroomInstance as JSON
//        } else {
//            response.status = 500
//            render classroomInstance.errors as JSON
//        }
    }

    def edit(Classroom classroomInstance) {
        respond classroomInstance
    }

    @Transactional
    def update(Classroom classroomInstance) {
        if (classroomInstance == null) {
            notFound()
            return
        }

        if (classroomInstance.hasErrors()) {
            respond classroomInstance.errors, view:'edit'
            return
        }

        classroomInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Classroom.label', default: 'Classroom'), classroomInstance.id])
                redirect classroomInstance
            }
            '*'{ respond classroomInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Classroom classroomInstance) {

        if (classroomInstance == null) {
            notFound()
            return
        }

        classroomInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Classroom.label', default: 'Classroom'), classroomInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
