/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Relationship between User with your classes
 */

package com.ed.classroomcourse

import com.ed.schoolmanagement.User

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
