package com.ed.inductionClass

import com.ed.classroomcourse.StateClassroom
import com.ed.schoolmanagement.User
import com.ed.service.Office
import grails.converters.JSON

import org.springframework.format.annotation.DateTimeFormat

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class InductionClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render InductionClass.list([max: params.int('max')]) as JSON
    }

    def create() {
        render(new InductionClass() as JSON)
    }

    def save(Integer idOffice) {
        SimpleDateFormat dateParser = new SimpleDateFormat("dd MMMM yyyy - hh:mm a");
        InductionClass inductionClass = new InductionClass(request.JSON)
        inductionClass.setDate(dateParser.parse(request.JSON.date))
        inductionClass.stateClassroom = StateClassroom.findByName("Abierto")
        inductionClass.office = Office.findById(idOffice)
        if (inductionClass.validate(["name", "places"])) {
            print(inductionClass.name)
            print(inductionClass.places)
            print(inductionClass.date)
            inductionClass.save(flush: true)
            response.status = 200;
            render([inductionClass: inductionClass, message: message(code: "de.inductionClass.created.message")] as JSON)
        } else {
            response.status = 500;
            render(inductionClass.errors as JSON)
        }
    }

    def show(Integer id) {
        render(InductionClass.findById(id) as JSON)
    }

    def update(Integer idOffice) {
        SimpleDateFormat dateParser = new SimpleDateFormat("dd MMMM yyyy - hh:mm a");
        InductionClass ic = InductionClass.findById(request.JSON.id)
        ic.properties = request.JSON
        ic.setDate(dateParser.parse(request.JSON.date));
        ic.stateClassroom = StateClassroom.findByName("Abierto")
        ic.office = Office.findById(idOffice)
        if (ic.validate(["name", "places"])) {
            ic.save(flush: true)
            response.status = 200;
            render([inductionClass: ic, message: message(code: "de.inductionClass.updated.message")] as JSON)
        } else {
            response.status = 500;
            render(inductionClass.errors as JSON)
        }
    }

    def delete(Integer id) {
        def inductionClassInstance = InductionClass.findById(id ?: params.int("id"))
        if (User.findByInductionClass(inductionClassInstance) == null) {
            inductionClassInstance.delete(flush: true)
            response.status = 200
            render([message: message(code: 'de.inductionClass.deleted.message')] as JSON)
        } else {
            response.status = 500
            render([message: message(code: 'de.inductionClassUser', args: [inductionClassInstance.name])] as JSON)
        }
    }

    def getInductionClassByOffice(Integer id) {
        render InductionClass.findAllByOffice(Office.findById(id)) as JSON;
    }

    def saveClassInductionUser(Integer id) {
        User u = User.findById(id)
        u.inductionClass = InductionClass.findById(request.JSON.idI)
        u.save(flush: true)
        response.status = 200
        render([message: 'La clase ha sido registrada'] as JSON)
    }
}
