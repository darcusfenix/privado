package com.ed.services

import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserMailHistory
import groovy.time.TimeCategory
import uk.co.desirableobjects.sendgrid.SendGridEmail
import uk.co.desirableobjects.sendgrid.SendGridEmailBuilder

import java.text.DateFormat
import java.text.SimpleDateFormat

class NotificationService {

    def sendGridService
    def grailsApplication

    def sendEmail(User user, String contextPath, def params = [:]) {
        DateFormat formatter = new SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy", new Locale("es", "MX"));
        String htmlContent = new File(contextPath + grailsApplication.config.files.htmlMailContent).text

        def binding = [:]
        binding.userFullName = user.fullName
        binding.assignedGroup = params?.classRoomName ?: "ABC"[(int) 3 * Math.random()]
        //TODO consider the current date to generate the format string
        Date currentDate = new Date()
        use(TimeCategory) {
            if (false) {
                binding.inductionDate = formatter.format(currentDate)
            } else {
                binding.inductionDate = formatter.format(currentDate)
            }
        }
        binding.enrollmentUrl = params.activationUrl
        binding.price = 1500

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
}
