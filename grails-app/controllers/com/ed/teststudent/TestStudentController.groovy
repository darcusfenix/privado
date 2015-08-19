package com.ed.teststudent

import com.ed.schoolmanagement.User
import com.ed.service.MockExam
import com.ed.teststructure.Answer
import com.ed.teststructure.Question
import com.ed.teststructure.Section
import com.ed.teststructure.Structure
import com.ed.teststructure.StructureSection
import com.ed.teststructure.UserStructure
import grails.plugin.springsecurity.annotation.Secured
import groovy.time.TimeCategory

import java.text.DateFormat
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class TestStudentController {

    def index(){


        if ((request.getAttribute("tk") ?: params.tk) == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken( params.tk ?: request.getAttribute("tk"))


        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return ;
        }

        //TODO verificar el id del examen
        def confirm = UserStructure.findByUserAndStructure(user,Structure.findById(1))


        if (confirm != null){
            log.error("************************ TERCER VALIDACIÓN SI YA ESTÁ EN EL EXAMEN")
            redirect(uri: "/examen/menu")
            return ;
        }


        [user:user]
    }

    def enrolment(){


        if (params.tk == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }

        def user = User.findByActivationToken(params.tk)


        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return ;
        }

        def confirm = UserStructure.findByUser(user)



        if (confirm != null){

            redirect(uri: "/examen/menu")
            log.error("************************ TERCER VALIDACIÓN SI YA ESTÁ EN EL EXAMEN")
            return ;
        }


        UserStructure userStructure = new UserStructure()
        userStructure.aciertos = 0;
        userStructure.json = ""
        userStructure.user = user
        userStructure.inicioFechaHora = new Date()
        //TODO verificar el id del examen
        userStructure.structure = Structure.findByMockExamAndId(MockExam.findByActive(true), 1)
        String ruta;

        if(userStructure.validate()){
            userStructure.save(flush: true)
            request.setAttribute("tk", user.activationToken)
            ruta = "/examen/menu"

        }else {
            ruta = "/examen/error"
        }

        redirect(uri: ruta)
    }


    def menu() {


        if (request.getAttribute("tk") == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken(request.getAttribute("tk"))


        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return ;
        }

        //TODO verificar el id del examen
        def userStructure = UserStructure.findByUserAndStructure(user,Structure.findById(1))


        if (userStructure == null){
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA")
            return ;
        }

        Date now = new Date()
        Date nd = userStructure.inicioFechaHora
        Date limite = nd;
        Date difference = new Date()
        use(TimeCategory) {
            limite = (nd + 80.minutes)
            difference = (limite - now.minutes)
        }

        log.error("************************ INICIÉ " + nd)
        log.error("************************ AHORA " + now)
        log.error("************************ LIMITE " + limite)


        long diff = 0

        if(now.after(userStructure.inicioFechaHora) && now.before(limite)) {
            log.error("**************************** ESTOY A TIEMPO")

                diff =  limite.getTime() -  now.getTime()

            log.error("************************* ME QUEDAN: " + diff)

        }else{
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return ;
        }




        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def questions = [:]

        def map = StructureSection.findAllByStructure(Structure.findById(1)).each { structureSection ->
            questions.put(structureSection.section.id,Question.findAllBySection(structureSection.section))
        }

        [relations:map, colors : colors, questions: questions, diff : diff]

    }
    
    def resultado(Integer id){
        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def questions = [:]

        def map = StructureSection.findAllByStructure(Structure.findById(1)).each { structureSection ->
            questions.put(structureSection.section.id,Question.findAllBySection(structureSection.section))
        }
        [relations:map, colors : colors, questions: questions]
    }


    def pregunta(Integer id){
        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def answers

        def mapQuestion = Question.findById(id).each { question ->
            answers  = Answer.findAllByQuestion(question)
        }

        [mapQuestion:mapQuestion, colors : colors, answers: answers]
    }
}
