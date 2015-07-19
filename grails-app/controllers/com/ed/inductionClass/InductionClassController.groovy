package com.ed.inductionClass

import com.ed.classroomcourse.StateClassroom
import grails.converters.JSON
import org.springframework.format.annotation.DateTimeFormat

import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class InductionClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render InductionClass.list([max: params.int('max')]) as JSON
    }

    def create(){
        render (new InductionClass() as JSON)
    }

    def save(){
        DateTimeFormatter f = DateTimeFormatter.ofPattern("dd MMMM yyyy - hh:mm a");
        InductionClass inductionClass = new InductionClass(request.JSON)
        inductionClass.setDate(LocalDateTime.from(f.parse(request.JSON.date)));
        inductionClass.stateClassroom = StateClassroom.findByName("Abierto")
        if(inductionClass.validate(["name", "places"])){
            print(inductionClass.name)
            print(inductionClass.places)
            print(inductionClass.date)
            inductionClass.save(flush: true)
            response.status = 200;
            render([inductionClass: inductionClass, message: message(code: "de.office.created.message")] as JSON)
        }else{
            response.status = 500;
            render(inductionClass.errors as JSON)
        }
    }

}
