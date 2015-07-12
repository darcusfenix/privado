package com.controlescuela


import grails.converters.JSON

class ServiceController {

    def index() {
        render Service.list([max: params.int('max')]) as JSON
    }

}
