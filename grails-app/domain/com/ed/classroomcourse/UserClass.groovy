/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.classroomcourse

import com.controlescuela.User

class UserClass implements Serializable {

    User user
    Class clazz

    static constraints = {
    }

    static mapping = {
        table 't_user_class_tab'
        id composite: ['user', 'clazz']
        version false
    }
}
