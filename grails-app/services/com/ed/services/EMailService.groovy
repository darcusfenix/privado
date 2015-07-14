package com.ed.services

import com.ed.schoolmanagement.User

import uk.co.desirableobjects.sendgrid.SendGridEmail
import uk.co.desirableobjects.sendgrid.SendGridEmailBuilder

class EMailService {

    def sendGridService

    def sendEmail(User user) {
        String activationToken = "$user.email|$user.id".encodeAsBase64()
        SendGridEmail email = new SendGridEmailBuilder()
                .from('antony@example.com')
                .to('jresendiz27@gmail.com')
                .subject('This is the subject line')
                .withText('This is our message body')
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
