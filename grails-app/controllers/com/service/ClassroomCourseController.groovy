package com.service

import com.ed.service.ClassroomCourse
import grails.converters.JSON

class ClassroomCourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render (ClassroomCourse.list() as JSON)
    }
    def show(Integer id){
        render (ClassroomCourse.findById(1) as JSON)
    }
    def save(){

    }
    def update(){

    }
    def delete(){

    }
}
