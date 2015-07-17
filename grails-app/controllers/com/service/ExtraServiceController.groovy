package com.service

import com.ed.service.ExtraService
import com.ed.service.MockExam
import grails.converters.JSON

class ExtraServiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render (ExtraService.list() as JSON )
    }

    def show (Integer id){
        render(MockExam.findById(id ?: params.int("id") ) as JSON)
    }
}
