package com.ed.classroomcourse

import grails.converters.JSON

import grails.transaction.Transactional

import java.sql.Time
import java.text.DateFormat
import java.text.SimpleDateFormat

class ClassroomController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Classroom.list([max: params.int('max')]) as JSON
    }

    def show(Classroom classroomInstance) {
        respond classroomInstance
    }

    def create() {
        respond (new Classroom() as JSON)
    }

    def save(String lista) {
        print(request.JSON)
        def classroomInstance = new Classroom(request.JSON)
        classroomInstance.stateClassroom = StateClassroom.findByName("Abierto");

        if(classroomInstance.validate()){
            SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy");
            SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss a");
            classroomInstance.save()
            def arrayClass = lista.split(",,")
            Class clazz = null

            for(String a: arrayClass){
                def json = JSON.parse(a)
                clazz = new Class()
                clazz.setName(json.name)
                clazz.setDateClass(sdf.parse(json.dateClass))
                clazz.setStHour(formatter.parse(json.stHour))
                clazz.setEndHour(formatter.parse(json.endHour))
                clazz.classroom = classroomInstance
                clazz.save(flush: true)
            }
            response.status = 200
            render([classroom: classroomInstance, message: message(code: "de.classroom.created.message")] as JSON)
        }else{
            response.status = 500
            render(classroomInstance.errors as JSON)
        }

        //print(id)
//        if (classroomInstance.save(flush: true, failOnError: true)) {
//            response.status = 200
//            render classroomInstance as JSON
//        } else {
//            response.status = 500
//            render classroomInstance.errors as JSON
//        }
    }


}
