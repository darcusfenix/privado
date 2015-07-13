package com.controlescuela

import com.ed.service.TypeService
import grails.converters.JSON

class TypeServiceController {

    def index() {
        render TypeService.list() as JSON
    }
    def show(Integer id){
        render  (TypeService.findById(id ?: params.int("id")) as JSON)
    }
}
