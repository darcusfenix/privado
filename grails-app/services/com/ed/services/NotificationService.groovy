package com.ed.services

import com.ed.schoolmanagement.User

import uk.co.desirableobjects.sendgrid.SendGridEmail
import uk.co.desirableobjects.sendgrid.SendGridEmailBuilder

class NotificationService {

    def sendGridService
    def grailsApplication

    def sendEmail(User user, def request) {
        log.error grailsApplication.config.files.htmlMailContent
        log.error grailsApplication.config.files.htmlMailContent
        log.error grailsApplication.config.files.htmlMailContent
        log.error grailsApplication.config.files.htmlMailContent
        log.error grailsApplication.config.files.htmlMailContent
        String htmlContent = new File(request.contextPath +  grailsApplication.config.files.htmlMailContent).text
        String activationToken = "$user.email|$user.id".encodeAsBase64()
        SendGridEmail email = new SendGridEmailBuilder()
                .from('noreply@cursopreparacionipn.com')
                .to(user.email)
                .subject('Curso de preparación IPN')
                .withHtml(htmlContent)
                .addAttachment("PreparacionIPNCroquis.pdf",new File(grailsApplication.config.files.pdfFile))
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
