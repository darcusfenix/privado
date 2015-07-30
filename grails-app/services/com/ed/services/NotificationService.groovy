package com.ed.services

import com.ed.classroomcourse.UserClass
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
        DateFormat hourFormatter = new SimpleDateFormat("hh:mm", new Locale("es", "MX"));

        def binding = [:]
        binding.userFullName = user.fullName
        binding.assignedGroup = params?.classRoomName ?: "ABC"[(int) 3 * Math.random()]
        binding.dateHour = ""
        // There's an induction class
        if(user.inductionClass){
            binding.inductionDate = formatter.format(user.inductionClass.date)
        } else { // Assign half hour before the lesson hour for the next date
            UserClass userClassroom = UserClassroom.findByUser(user)
            Date halfHourBefore
            use(TimeCategory){
                halfHourBefore = userClassroom.clazz.stHour - 30.minutes
            }
            binding.inductionDate = formatter.format(halfHourBefore)
            binding.dateHour = hourFormatter.format(halfHourBefore)
        }
        binding.enrollmentUrl = params.activationUrl
        binding.price = 1500 // TODO Get related user services to get the price
        if(binding.dateHour == ""){ // Loading other template and generationg a new appointment
            htmlContent = new File(contextPath + grailsApplication.config.files.htmlMailContent).text
        } else { // Simple template with validation token
            //TODO create and modify new html content for mail template
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
}
