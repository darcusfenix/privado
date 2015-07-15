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
        DateFormat formatter = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", new Locale("es", "MX"));
        String htmlContent = new File(contextPath + grailsApplication.config.files.htmlMailContent).text
        String activationToken = "$user.email|$user.id".encodeAsBase64()
        def binding = [userFullName: user.fullName, inductionDate: formatter.format(new Date()), activationToken: activationToken]
        def engine = new groovy.text.SimpleTemplateEngine()
        def template = engine.createTemplate(htmlContent).make(binding)
        log.error(template.toString())
        SendGridEmail email = new SendGridEmailBuilder()
                .from('noreply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(template.toString())
                .addAttachment("PreparacionIPNCroquis.pdf", new File(contextPath + grailsApplication.config.files.pdfFile))
                .build()
        sendGridService.send(email)
        return true
    }

    def validateAccount(String validationToken) {
        List components = validationToken.decodeBase64().split("|")
        User user = User.findByEmailAndId(components[0], Integer.parseInt(components[1]))
        user.active = true
        if (user.save(flush: true)) {
            return true
        } else {
            return false
        }

    }

}
