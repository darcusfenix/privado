package com.service

import com.ed.service.ExtraIncome
import com.ed.service.ExtraService
import com.ed.service.OnlineCourse
import grails.converters.JSON

class ExtraIncomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render( ExtraIncome.list() as JSON)
    }
    def create(){
        render( new ExtraIncome() as JSON)
    }
    def show(Integer id){
        render( ExtraIncome.findById(id ?: params.int("id")) as JSON)
    }
    def save (){

        def extraIncomeInstance = new ExtraIncome()
        extraIncomeInstance.properties = request.JSON
        extraIncomeInstance.incomeDate = new Date()

        if (ExtraService.findById(request.JSON.extraService.id).cost != request.JSON.income){
            response.status = 500
            render([extraIncomeInstance: extraIncomeInstance, error: "La cantidad no corresponde a lo requerido"] as JSON)
            return  false;
        }

        if (extraIncomeInstance.validate()) {
            extraIncomeInstance.save(flush: true)
            response.status = 200
            render([extraIncomeInstance: extraIncomeInstance, message: message(code: "extraIncomeInstance.created")] as JSON)

        } else {
            response.status = 500
            render(extraIncomeInstance.errors as JSON)
        }
    }
    def update(){

    }
    def delete(){

    }
}
