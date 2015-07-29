package com.ed.services

import com.ed.inductionClass.InductionClass
import com.ed.schoolmanagement.User
import com.ed.service.UserClassroom
import grails.transaction.Transactional
import groovy.time.TimeCategory

@Transactional
class EnrollmentService {

    def validateAccount(String activationToken) {
        User user = User.findByActivationToken(activationToken)
        if (user) {
            user.active = true
            user.activationDate = new Date();
            //TODO assign group or activated just after the user is valid!
            UserClassroom userClassroom = UserClassroom.findByUser(user)
            userClassroom.activated = true
            userClassroom.save()
            if (user.save(flush: true)) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }

    def getInductionClass() {
        InductionClass inductionClass =  null
        // Bussiness Rule 1, Just assign if it's sunday before 4:30 an induction class!
        Calendar cal = Calendar.getInstance()
        cal.set(2015, Calendar.AUGUST, 8);
        Date currentDate = new Date();
        Date sundayDate = cal.getTime();

        if (TimeCategory.minus(currentDate, sundayDate).days == 0) { //Still sunday!
            cal.set(2015, Calendar.AUGUST, 8, 9, 30) // 11:00
            Date firstInductionDate = cal.getTime()
            cal.set(2015, Calendar.AUGUST, 8, 11, 30) // 13:00
            Date secondInductionDate = cal.getTime()
            cal.set(2015, Calendar.AUGUST, 8, 14, 30) // 16:00
            Date thirdInductionDate = cal.getTime()
            cal.set(2015, Calendar.AUGUST, 8, 16, 30) // 18:00
            Date fourthInductionDate = cal.getTime()
            if (currentDate < firstInductionDate) { //Induction class 1
                inductionClass = InductionClass.findByName("Clase de Inducción 1")
            }
            if (currentDate >= firstInductionDate && currentDate < secondInductionDate) { //Induction class 2
                inductionClass = InductionClass.findByName("Clase de Inducción 2")
            }
            if (currentDate >= secondInductionDate && currentDate < thirdInductionDate) { //Induction class 3
                inductionClass = InductionClass.findByName("Clase de Inducción 3")
            } else { // Induction class 4
                inductionClass = InductionClass.findByName("Clase de Inducción 4")
            }
            //There's at least one place on the induction class
            if(inductionClass.places>=1){
                inductionClass.places--
                inductionClass.save(flush: true) //Update the places of the induction class!
            } else {
                inductionClass = InductionClass.findByPlacesGreaterThan(1);
                inductionClass.places--
                inductionClass.save(flush: true) //Update the places of the induction class!
            }
            return inductionClass
        } else { //No induction class assigned
            return inductionClass
        }

    }
}
