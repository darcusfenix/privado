package com.ed.service

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(rollbackForClassName )
class OfficeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Office.list([max: params.int('max')]) as JSON
    }

    def show(Integer id) {
        render(Office.findById(id ?: params.int("id")) as JSON)
    }

}
