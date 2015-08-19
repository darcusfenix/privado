package com.ed.teststudent

import com.ed.schoolmanagement.User
import com.ed.service.MockExam
import com.ed.teststructure.Answer
import com.ed.teststructure.Question
import com.ed.teststructure.Section
import com.ed.teststructure.Structure
import com.ed.teststructure.StructureSection
import com.ed.teststructure.UserStructure
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import groovy.time.TimeCategory

import java.text.DateFormat
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class TestStudentController {

    def index(String tk){

        // si la variable no existe
        if ((tk ?: params.tk) == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken(tk ?: params.tk)

        // si el usuario no existe
        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return ;
        }
        //TODO verificar el id del examen
        def confirm = UserStructure.findByUserAndStructure(user,Structure.findById(1))
        String ruta

        // si ya está en el examen lo pasa directamente
        if (confirm != null){
            ruta = "/examen/menu?tk=" + user.activationToken
            log.error("************************ TERCER VALIDACIÓN SI YA ESTÁ EN EL EXAMEN")
            redirect(uri: ruta)
            return ;
        }

        // si no pasó nada anteriormente, lo deja ver index con datos de usuario
        [user:user]
    }

    def enrolment(String tk){

        // si la variable no existe
        if ((tk ?: params.tk) == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }

        def user = User.findByActivationToken(tk ?: params.tk)

        // si el usuario no existe
        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return ;
        }

        def confirm = UserStructure.findByUser(user)
        String ruta

        // si ya está en el examen lo pasa directamente
        if (confirm != null){
            ruta = "/examen/menu?tk=" + user.activationToken
            redirect(uri: ruta)
            log.error("************************ TERCER VALIDACIÓN SI YA ESTÁ EN EL EXAMEN")
            return ;
        }

        // si no pasó nada anteriormente lo inscribe al examen
        UserStructure userStructure = new UserStructure()
        userStructure.aciertos = 0;
        userStructure.json = ""
        userStructure.user = user
        userStructure.inicioFechaHora = new Date()
        //TODO verificar el id del examen
        userStructure.structure = Structure.findByMockExamAndId(MockExam.findByActive(true), 1)


        if(userStructure.validate()){
            userStructure.save(flush: true)
            ruta = "/examen/menu?tk=" + user.activationToken

        }else {
            ruta = "/examen/error"
        }
        // ya lo inscribió lo pasa al menú o lo manda a error, depende de la validación anterior
        redirect(uri: ruta)
    }


    def menu(String tk) {

        // si la variable no existe
        if ((tk ?: params.tk) == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken(tk ?: params.tk)

        // si el usuario no existe
        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return ;
        }

        //TODO verificar el id del examen
        def userStructure = UserStructure.findByUserAndStructure(user,Structure.findById(1))

        // si el usuario no está en el examen lo saca
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

        //(year, month, day [, hour, minute, second, millisecond ])
        DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

        if(now.after(userStructure.inicioFechaHora) && now.before(limite)) {
            log.error("**************************** ESTOY A TIEMPO")

                diff =  limite.getTime() -  now.getTime()

            log.error("************************* ME QUEDAN: " + diff)


        }else{
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return ;
        }


        // si no pasó nada anteriormente lo deja ver el menú

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

    def respuestasPreguntas(){
        def result = [:]
        def nextQuestion

        result['pregunta'] = params.idPregunta
        result['respuesta'] = params.respuesta

        [resultados: result as JSON]



        nextQuestion = params.idPregunta++
        redirect(uri: "/examen/question/nextQuestion")
    }
}
