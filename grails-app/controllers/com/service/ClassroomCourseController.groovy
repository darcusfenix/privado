package com.service

import com.ed.service.ClassroomCourse
import com.ed.service.TypeCourse
import com.ed.service.TypeService
import grails.converters.JSON

class ClassroomCourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render (ClassroomCourse.list() as JSON)
    }
    def show(Integer id){
        render( ClassroomCourse.findById(id ?: params.int("id")) as JSON)
    }
    def save(){

    }
    def update(){

    }
    def delete(){

    }
}
