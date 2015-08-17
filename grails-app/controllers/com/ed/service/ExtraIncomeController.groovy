package com.ed.service

import com.ed.service.ExtraIncome
import com.ed.service.ExtraService
import com.ed.service.OnlineCourse
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import java.text.SimpleDateFormat

@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
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
            render([extraIncomeInstance: extraIncomeInstance, message: message(code: "extraIncome.created")] as JSON)

        } else {
            response.status = 500
            render(extraIncomeInstance.errors as JSON)
        }
    }
    def update(){
        SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yyyy HH:mm:ss");
        def extraIncomeInstance = ExtraIncome.findById(request.JSON.id)


        if (ExtraService.findById(request.JSON.extraService.id).cost != request.JSON.income){
            response.status = 500
            render([extraIncomeInstance: extraIncomeInstance, error: "La cantidad no corresponde a lo requerido"] as JSON)
            return  false;
        }

        def jsonMap = [:]

        jsonMap = request.JSON

        Date incomeDate = sdf.parse(request.JSON.incomeDate)

        extraIncomeInstance.incomeDate = incomeDate


        jsonMap.remove('incomeDate')

        extraIncomeInstance.properties = request.JSON

        if (extraIncomeInstance.validate()) {

            extraIncomeInstance.save(flush: true)
            response.status = 200
            render([extraIncomeInstance: extraIncomeInstance, message: message(code: "extraIncome.updated")] as JSON)
        }else{
            response.status = 500
            render(extraIncomeInstance.errors as JSON)
        }
    }
    def delete(){
        ExtraIncome extraIncome = ExtraIncome.findById(params.int("id"))
        extraIncome.delete(flush: true)
        response.status = 200
        render([success: message(code: 'extraIncome.deleted')] as JSON)

    }
}
