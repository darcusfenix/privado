package com.ed.classroomcourse

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class ClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Class.list([max: params.int('max')]) as JSON
    }

    def getClassByClassroom(Long id){
        render Class.findAllByClassroom(Classroom.findById(id)) as JSON
    }

}
