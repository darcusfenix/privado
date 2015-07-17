package com.ed.classroomcourse

import com.ed.service.Office
import grails.converters.JSON

import grails.transaction.Transactional

import java.sql.Time
import java.text.DateFormat
import java.text.ParseException
import java.text.SimpleDateFormat

class ClassroomController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Classroom.list([max: params.int('max')]) as JSON
    }

    def show(Integer id) {
        render Classroom.findById(id) as JSON;
    }

    def create() {
        render (new Classroom() as JSON)
    }

    def getClassroomByOffice(Integer id){
        render Classroom.findAllByOffice(Office.findById(id)) as JSON;
    }

    def save(String lista, Integer idOffice) {

        def classroomInstance = new Classroom(request.JSON)

        def criteriaClassroom = Classroom.createCriteria()
        def res = criteriaClassroom.get {
            eq("nameClassroom", classroomInstance.nameClassroom) and {
                eq("office", Office.findById(idOffice))
            }
        }

        if(res != null){
            response.status = 500
            render([classroom: classroomInstance, message: message(code: "de.classroom.errorNameClassroom.message")] as JSON)
        }else {
            classroomInstance.stateClassroom = StateClassroom.findByName("Abierto");
            classroomInstance.office = Office.findById(idOffice);

            if (classroomInstance.validate()) {
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss a");
                classroomInstance.save()
                def arrayClass = lista.split(",,")
                Class clazz = null

                for (String a : arrayClass) {
                    def json = JSON.parse(a)
                    clazz = new Class()
                    clazz.setName(json.name)
                    try {
                        clazz.setDateClass(sdf.parse(json.dateClass))
                        clazz.setStHour(formatter.parse(json.stHour))
                        clazz.setEndHour(formatter.parse(json.endHour))
                        clazz.classroom = classroomInstance
                        clazz.save(flush: true)
                    } catch (ParseException pe) {
                        Class.executeUpdate("delete Class c where c.classroom = :classroom", [classroom: classroomInstance])
                        classroomInstance.delete(flush: true)
                        response.status = 500
                        render([classroom: classroomInstance, message: message(code: "de.classroom.errorDate.message")] as JSON)
                    }
                }
                response.status = 200
                render([classroom: classroomInstance, message: message(code: "de.classroom.created.message")] as JSON)
            } else {
                response.status = 500
                render(classroomInstance.errors as JSON)
            }
        }
    }

}
