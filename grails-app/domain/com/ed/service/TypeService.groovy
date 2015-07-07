/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of service catalog
 */

package com.ed.service

class TypeService {

    Integer id
    String name
    String description

    static constraints = {
    }

    static mapping = {
        table 't_type_service_cat'
        id name: 'id', column: 'id_type', generator: 'identity'
        name column: 'nb_type'
        description column: 'ds_type'
        version false
    }
}
