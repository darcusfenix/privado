package com.ed.services

import com.ed.schoolmanagement.Appointment
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserMailHistory
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
}
