package com.ed.teststructure

import com.ed.schoolmanagement.User

/**
 * Created by fernandotapia on 7/28/15.
 */
class UserStructure implements Serializable {
    User user
    Structure structure

    static constraints = {}

    static mapping = {
        table 't_user_structure_tab'
        id composite: ['user', 'structure']
        version false
    }
}
