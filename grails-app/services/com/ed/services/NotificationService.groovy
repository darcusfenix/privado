package com.ed.services

import com.ed.schoolmanagement.User

import uk.co.desirableobjects.sendgrid.SendGridEmail
import uk.co.desirableobjects.sendgrid.SendGridEmailBuilder

import java.text.DateFormat
import java.text.SimpleDateFormat

class NotificationService {

    def sendGridService
    def grailsApplication

    def sendEmail(User user, String contextPath) {
        //TODO consider the hour, check the image!!!!
        //TODO consider the hour, check the image!!!!
        DateFormat formatter = new SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy", new Locale("es", "MX"));
        String htmlContent = new File(contextPath + grailsApplication.config.files.htmlMailContent).text
        user.activationToken = "${user.email}|${user.username}|${user.fullName}".encodeAsMD5().substring(0,20)
        user.save(flush:true);
        def activationToken = user.activationToken
        def binding = [:]
        binding.userFullName = user.fullName
        binding.assignedGroup = "ABC"[(int)3*Math.random()] //TODO: assign specific group
        binding.inductionDate = formatter.format(new Date())
        binding.enrollmentUrl= activationToken
        binding.price = 1500
        def engine = new groovy.text.SimpleTemplateEngine()
        def template = engine.createTemplate(htmlContent).make(binding)
        log.error(template.toString())
        SendGridEmail email = new SendGridEmailBuilder()
                .from('noreply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(template.toString())
                .build()
        try{
            sendGridService.send(email)
            return true
        } catch (Exception e){
            return false
        }
    }

    def validateAccount(String activationToken) {
        User user = User.findByActivationToken(activationToken)
        user.active = true
        user.activationDate = new Date();
        if (user.save(flush: true)) {
            return true
        } else {
            return false
        }

    }

}
