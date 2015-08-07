package com.ed.schoolmanagement

class Appointment {
    User user
    Date appointmentDate

    static constraints = {
        appointmentDate nullable: false, blank: false
    }

}
