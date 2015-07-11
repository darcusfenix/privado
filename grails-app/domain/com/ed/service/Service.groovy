/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a service [extraIncome, website, Classroom, Mock Exam]
 */

package com.ed.service

import com.ed.accesscontrol.StudentService

class Service implements Serializable{

    Float cost
    String period
    Boolean active
    Date stDate
    Date endDate
    static hasMany = [studentService: StudentService]
    TypeService typeService

    static constraints = {
        cost nullable: false
        period nullable: false, matches: "\\d{4}-\\d{2}"
        active nullable: true
        stDate nullable: true, blank: true
        endDate nullable: true, blank: true

    }

    static mapping = {
        tablePerHierarchy false
        table 't_service_tab'
        id column: 'id_service', generator: 'identity'
        cost column: 'nu_cost'
        period column: 'tx_period'
        active column: 'st_active'
        stDate column: 'fh_start'
        endDate column: 'fh_end'
        version false
    }
}
