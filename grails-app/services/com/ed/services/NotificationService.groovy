package com.ed.services

import com.ed.classroomcourse.Class
import com.ed.classroomcourse.Classroom
import com.ed.schoolmanagement.Appointment
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserMailHistory
import com.ed.service.UserClassroom
import groovy.time.TimeCategory
import uk.co.desirableobjects.sendgrid.SendGridEmail
import uk.co.desirableobjects.sendgrid.SendGridEmailBuilder

import java.text.DateFormat
import java.text.SimpleDateFormat

class NotificationService {

    def sendGridService
    def grailsApplication

    def sendEmail(User user, String contextPath, def params = [:]) {
        String htmlContent
        // Dates and calendar instances
        Calendar cal = Calendar.getInstance()
        DateFormat formatter = new SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy", new Locale("es", "MX"));
        DateFormat hourFormatter = new SimpleDateFormat("hh:mm a", new Locale("es", "MX"));

        def binding = [:]
        String g = ""
        if (user.gender == "Masculino") {
            g = "Estimado"
        } else {
            g = "Estimada"
        }
        binding.userFullName = g + " " + user.fullName
        binding.assignedGroup = params?.classRoomName ?: "ABC"[(int) 3 * Math.random()]
        binding.dateHour = ""

        // There's an induction class
        if (user.inductionClass) {
            binding.inductionDate = formatter.format(user.inductionClass.date)
            binding.dateHour = hourFormatter.format(user.inductionClass.date)
            htmlContent = new File(contextPath + grailsApplication.config.files.htmlMailContent).text
        } else { //
            // Check for appointment!
            Appointment appointment = Appointment.findByUser(user)
            binding.inductionDate = formatter.format(appointment.appointmentDate)
            binding.dateHour = hourFormatter.format(appointment.appointmentDate)
            htmlContent = new File(contextPath + grailsApplication.config.files.nextDayMailContent).text
        }

        binding.enrollmentUrl = params.activationUrl
        binding.price = 1500 // TODO Get related user services to get the price

        if (binding.dateHour == "") { // Loading other template and generationg a new appointment
            htmlContent = new File(contextPath + grailsApplication.config.files.htmlMailContent).text
        } else { // Simple template with validation token
            htmlContent = new File(contextPath + grailsApplication.config.files.nextDayMailContent).text
        }


        def engine = new groovy.text.SimpleTemplateEngine()
        def template = engine.createTemplate(htmlContent).make(binding)
        SendGridEmail email = new SendGridEmailBuilder()
                .from('no-reply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(template.toString())
                .build()
        try {
            sendGridService.send(email)
            return true
        } catch (Exception e) {
            UserMailHistory userMailHistory = new UserMailHistory()
            userMailHistory.to = user.email;
            userMailHistory.from = "no-reply@cursopreparacionipn.com"
            userMailHistory.subject = "Curso de preparación IPN"
            userMailHistory.htmlContent = template.toString()
            userMailHistory.save(flush: true, failOnError: true)
            return false
        }
    }

    def sendSketchMail(String activationToken, String contextPath, def params = [:]) {
        User user = User.findByActivationToken(activationToken)
        user.activationToken = null
        user.save(flush: true)
        String htmlContent

        def binding = [:]
        binding.userFullName = user.fullName

        htmlContent = new File(contextPath + grailsApplication.config.files.sketchMail).text

        def engine = new groovy.text.SimpleTemplateEngine()
        def template = engine.createTemplate(htmlContent).make(binding)
        SendGridEmail email = new SendGridEmailBuilder()
                .from('no-reply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(template.toString())
                .addAttachment("PreparacionIPNCroquis.pdf", new File(contextPath + grailsApplication.config.files.pdfFile))
                .build()
        try {

            sendGridService.send(email)
            return true

        } catch (Exception e) {
            UserMailHistory userMailHistory = new UserMailHistory()
            userMailHistory.to = user.email;
            userMailHistory.from = "no-reply@cursopreparacionipn.com"
            userMailHistory.subject = "Curso de preparación IPN"
            userMailHistory.htmlContent = template.toString()
            userMailHistory.attachmentPath = contextPath + grailsApplication.config.files.pdfFile
            userMailHistory.save(flush: true, failOnError: true)
            return false
        }
    }
    def sendEmailToForeignStudent(String activationToken, String contextPath) {
        User user = User.findByActivationToken(activationToken)
        //User user = User.findById(2)

        Date date = new Date();

        DateFormat formatter = new SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy 'a las ' hh:mm a ", new Locale("es", "MX"));
        DateFormat formatterHour = new SimpleDateFormat("hh:mm a ", new Locale("es", "MX"));


        Class c = Class.findByClassroom(Classroom.findById(user.group.id))

        Date nd = new Date()
        Date now = new Date()
        nd = c.dateClass

        nd.setHours(c.stHour.getHours())
        nd.setMinutes(c.stHour.getMinutes())

        use(TimeCategory) {
            nd =  (nd + 6.hours)
        }

        String htmlContent

        def binding = [:]

        binding.userFullName = user.fullName
        binding.grupo = user.group.nameClassroom
        binding.horaInicio = formatter.format( c.dateClass)
        binding.horaLimit = formatterHour.format(nd)
        binding.now = formatter.format(now)

        log.error(binding)

        htmlContent = new File(contextPath + grailsApplication.config.files.foreignStudent).text

        def engine = new groovy.text.SimpleTemplateEngine()
        def template = engine.createTemplate(htmlContent).make(binding)
        SendGridEmail email = new SendGridEmailBuilder()
                .from('no-reply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(template.toString())
                .addAttachment("PreparacionIPNCroquis.pdf", new File(contextPath + grailsApplication.config.files.temario))
                .build()
        try {

            sendGridService.send(email)
            return true

        } catch (Exception e) {
            UserMailHistory userMailHistory = new UserMailHistory()
            userMailHistory.to = user.email;
            userMailHistory.from = "no-reply@cursopreparacionipn.com"
            userMailHistory.subject = "Curso de preparación IPN"
            userMailHistory.htmlContent = template.toString()
            userMailHistory.attachmentPath = null
            userMailHistory.save(flush: true, failOnError: true)
            return false
        }
    }
    def sendEmailAddress(Integer id, String contextPath) {
        User user = User.findById(id)

        String htmlContent

        def binding = [:]

        binding.userFullName = user.fullName

        htmlContent = new File(contextPath + grailsApplication.config.files.address).text

        def engine = new groovy.text.SimpleTemplateEngine()
        def template = engine.createTemplate(htmlContent).make(binding)
        SendGridEmail email = new SendGridEmailBuilder()
                .from('no-reply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(template.toString())
                .addAttachment("PreparacionIPNCroquis.pdf", new File(contextPath + grailsApplication.config.files.temario))
                .build()
        try {

            sendGridService.send(email)
            return true

        } catch (Exception e) {

            UserMailHistory userMailHistory = new UserMailHistory()
            userMailHistory.to = user.email;
            userMailHistory.from = "no-reply@cursopreparacionipn.com"
            userMailHistory.subject = "Curso de preparación IPN"
            userMailHistory.htmlContent = template.toString()
            userMailHistory.attachmentPath = null
            userMailHistory.save(flush: true, failOnError: true)
            return false

        }

    }
}
