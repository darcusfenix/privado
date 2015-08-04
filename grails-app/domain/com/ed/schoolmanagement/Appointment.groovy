package com.ed.schoolmanagement

class Appointment {
    User user
    Date appointmentDate

    static constraints = {
        appointmentDate nullable: false, blank: false
    }
    def beforeInsert(){
        this.appointmentDate = new Date();
    }
}
