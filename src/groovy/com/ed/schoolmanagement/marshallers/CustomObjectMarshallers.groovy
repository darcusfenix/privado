package com.ed.schoolmanagement.marshallers

/**
 * Created by alberto on 9/07/15.
 */
// DO NOT MODIFY
class CustomObjectMarshallers {
    List marshallers = []

    def register() {
        marshallers.each { it.register() }
    }

}
