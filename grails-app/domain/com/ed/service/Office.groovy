/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc: Entity to manage the business office
 */

package com.ed.service

class Office implements Serializable{

    Integer id
    String name
    String description
    //TODO: Think about of extra income for [ExtraService, ExtraIncome]

    static constraints = {
    }

    static mapping = {
        table 't_office_tab'
        id name: 'id', column: 'id_office', generator: 'identity'
        name column: 'nb_officce'
        description column: 'ds_office'
        version false
    }
}
