package com.service

import com.ed.service.TypeService
import grails.converters.JSON

class TypeServiceController {

    def index() {
        render TypeService.list() as JSON
    }

    def show(Integer id){
        render  (TypeService.findById(id ?: params.int("id")) as JSON)
    }
    def create(){
        render  new TypeService() as JSON
    }
    def update() {

        TypeService typeServiceInstance = TypeService.findById(request.JSON.id)

        typeServiceInstance.properties = request.JSON

        if (typeServiceInstance.validate()) {

            if (typeServiceInstance.save(flush: true)){
                response.status = 200
                render([typeService: typeServiceInstance, message: message(code: "typeService.updated")] as JSON)
            }else{
                response.status = 500
                render(typeServiceInstance.errors as JSON)
            }


        } else {
            response.status = 500
            render(typeServiceInstance.errors as JSON)
        }
    }
    def save(){
        def typeServiceInstance = new TypeService(request.JSON)
        if (typeServiceInstance.validate()) {
            typeServiceInstance.save(flush: true)
            response.status = 200
            render([typeServiceInstance: typeServiceInstance, message: message(code: "typeService.created")] as JSON)
        } else {
            response.status = 500
            render(typeServiceInstance.errors as JSON)
        }
    }
}
