/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc: Entity to manage the business office
 */

package com.ed.service

import com.ed.classroomcourse.Classroom

class Office implements Serializable{

    String name
    String description
    static hasMany = [classroom: Classroom]
    static mappedBy = [classroom: 'office']
    //TODO: Think about of extra income for [ExtraService, ExtraIncome]

    static constraints = {
    }

    static mapping = {
        table 't_office_tab'
        id column: 'id_office', generator: 'identity'
        name column: 'nb_officce'
        description column: 'ds_office'
        version false
    }
}
