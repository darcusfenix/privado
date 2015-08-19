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

    def index(){


        if (( params.tk ?: session.getAttribute("tk")) == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA -- INDEX")
            return ;
        }


        def user = User.findByActivationToken( params.tk ?: session.getAttribute("tk"))


        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA -- INDEX")
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
            log.error("************************ TOKEN" + user.activationToken)
            session.setAttribute("tk", user.activationToken)
            log.error("************************ SESSION TOKEN" + session.getAttribute("tk"))

            ruta = "/examen/menu"

        }else {
            ruta = "/examen/error"
        }

        redirect(uri: ruta)
    }


    def menu() {


        if (session.getAttribute("tk") == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA -- MENU")
            return ;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


        if(user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA -- MENU")
            return ;
        }

        //TODO verificar el id del examen
        def userStructure = UserStructure.findByUserAndStructure(user,Structure.findById(1))


        if (userStructure == null){
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA -- MENU")
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

        [relations:map, colors : colors, questions: questions, diff : diff, user: user]

    }
    
    def resultado(Integer id, String tk){

        if (session.getAttribute("tk") == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))

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

        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def questions = [:]

        def map = StructureSection.findAllByStructure(Structure.findById(1)).each { structureSection ->
            questions.put(structureSection.section.id,Question.findAllBySection(structureSection.section))
        }
        [relations:map, colors : colors, questions: questions, diff : diff]
    }


    def pregunta(Integer id, String tk){

        if (session.getAttribute("tk") == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


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

        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def answers

        def mapQuestion = Question.findById(id).each { question ->
            answers  = Answer.findAllByQuestion(question)
        }

        [mapQuestion:mapQuestion, colors : colors, answers: answers, diff : diff]
    }

    def respuestasPreguntas(){


        if (session.getAttribute("tk") == null){
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return ;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


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


        def result = [:]
        def questionAct

        result['pregunta'] = params.pregunta
            result['respuesta'] = params.respuesta


        [resultados: result as JSON]

        questionAct = params.pregunta

        def nextQuestion = Integer.parseInt(questionAct)
        nextQuestion = nextQuestion+1

        //TODO Realizar consulta para saber cual es el maximo de preguntas que existen relacionadas a la estructura
        if(nextQuestion==66){
            redirect(uri: "/examen/resultado")
        }else {
            redirect(uri: "/examen/question/$nextQuestion")
        }


        //userStructure.json=result

        print(userStructure.json)
    }
}
