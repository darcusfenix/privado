package com.service

import com.ed.service.OnlineCourse
import grails.converters.JSON

class OnlineCourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render( OnlineCourse.list() as JSON)
    }

    def show (Integer id){
        render( OnlineCourse.findById(id ?: params.int("id") ) )
    }
}
