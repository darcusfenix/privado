package com.service

import com.ed.service.MockExam
import grails.converters.JSON

class MockExamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render(MockExam.list() as JSON )
    }

    def show(Integer id){
        render ( MockExam.findById(id ?: params.int("id")) )
    }
}
