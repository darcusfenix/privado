package com.controlescuela

import grails.converters.JSON

class TypeServiceController {

    def index() {
        render TypeService.list([max: params.int('max')]) as JSON
    }
}
