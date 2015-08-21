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

//import groovy.json

import java.text.DateFormat
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class TestStudentController {

    def index() {


        if ((params.tk ?: session.getAttribute("tk")) == null) {
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA -- INDEX")
            return;
        }


        def user = User.findByActivationToken(params.tk ?: session.getAttribute("tk"))


        if (user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA -- INDEX")
            return;
        }


        def confirm
        def flag = 0;

        Structure.findAllByMockExam(MockExam.findByActive(true)).each { structure ->
            confirm = UserStructure.findByUserAndStructureAndFinalizado(user, structure, false)
            if (confirm != null) {
                // está en un examen
                flag = 1;
                return true;
            }
        }
        if (flag == 1) {
            log.error("************************ TERCER VALIDACIÓN SI YA ESTÁ EN EL EXAMEN")
            redirect(uri: "/examen/menu")
            return;
        }



        [user: user]
    }

    def enrolment() {
        log.error("********************************************** TRATAR DE INSCRIBIR")

        if (params.tk == null) {
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            redirect(uri: "/examen/error")
            return;
        }

        def user = User.findByActivationToken(params.tk)


        if (user == null) {
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            redirect(uri: "/examen/error")

            return;
        }


        def confirm
        def strutureSelected = new Structure()
        def flag = 0;

        // si estoy aún en un examen
        def structures = Structure.findAllByMockExam(MockExam.findByActive(true)).each { structure ->
            confirm = UserStructure.findByUserAndStructureAndFinalizado(user, structure, false)
            if (confirm != null) {
                flag = 1;
                return true;
            }
        }
        if (flag == 1) {
            log.error("************************ TERCER VALIDACIÓN SI YA ESTÁ EN EL EXAMEN")
            redirect(uri: "/examen/menu")
            return;
        }


        Date currentDate = new Date();

        Calendar zeroDay = Calendar.getInstance()
        zeroDay.set(2015, Calendar.AUGUST, 18);
        Date zero = zeroDay.getTime()

        Calendar oneDay = Calendar.getInstance()
        oneDay.set(2015, Calendar.AUGUST, 19);

        Date one = oneDay.getTime()

        Calendar secondDay = Calendar.getInstance()
        secondDay.set(2015, Calendar.AUGUST, 20);

        Date second = secondDay.getTime()

        Calendar thirdDay = Calendar.getInstance()
        thirdDay.set(2015, Calendar.AUGUST, 21);

        Date third = thirdDay.getTime()

        Calendar fourthDay = Calendar.getInstance()
        fourthDay.set(2015, Calendar.AUGUST, 22);

        Date fourth = fourthDay.getTime()

        if (currentDate.after(zero) && currentDate.before(second)) {
            for (int i = 0; i < structures.size(); i++) {
                if (structures.get(i).id == 1) {
                    strutureSelected = structures.get(i)

                }
            }
            log.error("******************************************** PRIMER DÍA")
        } else if (currentDate.after(second) && currentDate.before(third)) {
            for (int i = 0; i < structures.size(); i++) {
                if (structures.get(i).id == 2) {
                    strutureSelected = structures.get(i)
                }
            }
            log.error("******************************************** SEGUNDO DÍA")
        } else if (currentDate.after(third) && currentDate.before(fourth)) {
            for (int i = 0; i < structures.size(); i++) {
                if (structures.get(i).id == 3) {
                    strutureSelected = structures.get(i)
                }
            }
            log.error("******************************************** TERCER DÍA")
        }

        def verificar = UserStructure.findByUserAndStructure(user, strutureSelected)

        if (verificar != null) {
            log.error("************************ CUARTA VALIDACIÓN SI YA HIZO EL EXAMEN")
            redirect(uri: "/examen/resultado/" + strutureSelected.id)
            return;
        }

        UserStructure userStructure = new UserStructure()
        userStructure.aciertos = 0;
        userStructure.json = ""
        userStructure.user = user
        userStructure.finalizado = false
        userStructure.inicioFechaHora = new Date()
        userStructure.structure = strutureSelected
        String ruta;

        if (userStructure.validate()) {
            userStructure.save(flush: true)
            log.error("************************ TOKEN" + user.activationToken)
            session.setAttribute("tk", user.activationToken)
            log.error("************************ SESSION TOKEN" + session.getAttribute("tk"))

            ruta = "/examen/menu"

        } else {
            ruta = "/examen/error"
        }

        redirect(uri: ruta)
    }


    def menu() {


        if (session.getAttribute("tk") == null) {
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA -- MENU")
            return;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


        if (user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA -- MENU")
            return;
        }


        def userStructure

        Structure.findAllByMockExam(MockExam.findByActive(true)).each { structure ->

            def temp = UserStructure.findByUserAndStructureAndFinalizado(user, Structure.findById(structure.id), false)

            if (temp != null) {
                userStructure = temp
                return true
            }
        }

        if (userStructure == null) {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA -- MENU")
            return;
        }




        Date now = new Date()
        Date nd = userStructure.inicioFechaHora
        Date limite = nd;
        Date difference = new Date()
        use(TimeCategory) {
            limite = (nd + 80.minutes)
            difference = (limite - now.minutes)
        }

        long diff = 0

        if (now.after(userStructure.inicioFechaHora) && now.before(limite)) {
            diff = limite.getTime() - now.getTime()
        } else {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return;
        }


        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def questions = [:]

        def map = StructureSection.findAllByStructure(Structure.findById(userStructure.structure.id)).each { structureSection ->
            questions.put(structureSection.section.id, Question.findAllBySection(structureSection.section))
        }

        [relations: map, colors: colors, questions: questions, diff: diff, user: user, examen: userStructure.structure.name, examenId: userStructure.structure.id]

    }


    def finalizar(Integer id) {


        if (session.getAttribute("tk") == null) {
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA -- MENU")
            return;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


        if (user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA -- MENU")
            return;
        }

        //TODO verificar el id del examen

        def userStructure = UserStructure.findByUserAndStructureAndFinalizado(user, Structure.findById(id), false)



        if (userStructure == null) {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA -- MENU")
            return;
        }



        Date now = new Date()
        Date nd = userStructure.inicioFechaHora
        Date limite = nd;
        Date difference = new Date()
        use(TimeCategory) {
            limite = (nd + 80.minutes)
            difference = (limite - now.minutes)
        }

        long diff = 0

        if (now.after(userStructure.inicioFechaHora) && now.before(limite)) {
            diff = limite.getTime() - now.getTime()
        } else {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return;
        }

        userStructure.finalizado = true

        userStructure.save(flush: true)

        redirect(uri: "/examen/resultado/" + id)
    }


    def resultado(Integer id, String tk) {

        if (session.getAttribute("tk") == null) {
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))

        // si el usuario no existe
        if (user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return;
        }

        //TODO verificar el id del examen
        def userStructure
        def idStrutureSelected


        userStructure = UserStructure.findByUserAndStructureAndFinalizado(user, Structure.findById(id), true)

        // si el usuario no está en el examen lo saca
        if (userStructure == null) {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA")
            return;
        }

        idStrutureSelected = userStructure.structure.id

        Date now = new Date()
        Date nd = userStructure.inicioFechaHora
        Date limite = nd;
        Date difference = new Date()
        use(TimeCategory) {
            limite = (nd + 80.minutes)
            difference = (limite - now.minutes)
        }

        long diff = 0

        if (now.after(userStructure.inicioFechaHora) && now.before(limite)) {

            diff = limite.getTime() - now.getTime()

        } else {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return;
        }

        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def questions = [:]

        def map = StructureSection.findAllByStructure(Structure.findById(idStrutureSelected)).each { structureSection ->
            questions.put(structureSection.section.id, Question.findAllBySection(structureSection.section))
        }
        [relations: map, colors: colors, questions: questions, diff: diff, examen: userStructure.structure.name, examenId: userStructure.structure.id]
    }


    def pregunta(Integer id) {

        if (session.getAttribute("tk") == null) {
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


        if (user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return;
        }

        //TODO verificar el id del examen
        def userStructure

        Structure.findAllByMockExam(MockExam.findByActive(true)).each { structure ->
            def temp = UserStructure.findByUserAndStructureAndFinalizado(user, Structure.findById(structure.id), false)

            if (temp != null) {
                userStructure = temp
                return true
            }
        }


        if (userStructure == null) {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA")
            return;
        }

        Date now = new Date()
        Date nd = userStructure.inicioFechaHora
        Date limite = nd;
        Date difference = new Date()
        use(TimeCategory) {
            limite = (nd + 80.minutes)
            difference = (limite - now.minutes)
        }


        long diff = 0


        DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

        if (now.after(userStructure.inicioFechaHora) && now.before(limite)) {
            diff = limite.getTime() - now.getTime()
        } else {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return;
        }

        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def answers

        def mapQuestion = Question.findById(id).each { question ->
            answers = Answer.findAllByQuestion(question)
        }
        mapQuestion.text

        [mapQuestion: mapQuestion, colors: colors, answers: answers, diff: diff, examen: userStructure.structure.name, examenId: userStructure.structure.id]
    }

    def respuestasPreguntas() {


        if (session.getAttribute("tk") == null) {
            redirect(uri: "/examen/error")
            log.error("************************ PRIMER VALIDACIÓN FUERA")
            return;
        }


        def user = User.findByActivationToken(session.getAttribute("tk"))


        if (user == null) {
            redirect(uri: "/examen/error")
            log.error("************************ SEGUNDA VALIDACIÓN FUERA")
            return;
        }


        def userStructure

        Structure.findAllByMockExam(MockExam.findByActive(true)).each { structure ->
//            userStructure = UserStructure.findByUserAndStructureAndFinalizado(user, structure, false)
            def temp = UserStructure.findByUserAndStructureAndFinalizado(user, Structure.findById(structure.id), false)

            if (temp != null) {
                userStructure = temp
                return true
            }
        }

        if (userStructure == null) {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA")
            return;
        }

        Date now = new Date()
        Date nd = userStructure.inicioFechaHora
        Date limite = nd;
        Date difference = new Date()
        use(TimeCategory) {
            limite = (nd + 80.minutes)
            difference = (limite - now.minutes)
        }

        long diff = 0


        if (now.after(userStructure.inicioFechaHora) && now.before(limite)) {
            diff = limite.getTime() - now.getTime()
        } else {
            redirect(uri: "/examen/error")
            log.error("************************ TERCER VALIDACIÓN FUERA, YA PASO SU TIEMPO. DESPUÉS QUE SE MUESTRE OTRA VISTA O LA DE RESULTADOS")
            return;
        }


        def result = [:]
        def questionAct

        result['pregunta'] = params.pregunta
        result['respuesta'] = params.respuesta


        [resultados: result as JSON]

        questionAct = params.pregunta

        def nextQuestion = Integer.parseInt(questionAct)
        nextQuestion = nextQuestion + 1

        //TODO Realizar consulta para saber cual es el maximo de preguntas que existen relacionadas a la estructura

        def jsonStr = result.toString()
        //userStructure.json=jsonSt
        userStructure.setJson(jsonStr)
        userStructure.save(flush: true)

        print("EL RESULTADO EN CADENA DEL JSON: " + userStructure.json)

        if (nextQuestion == 66) {
            redirect(uri: "/examen/resultado")
        } else {
            redirect(uri: "/examen/question/$nextQuestion")
        }
    }
}
