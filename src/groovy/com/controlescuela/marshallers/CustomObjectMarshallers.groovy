package com.controlescuela.marshallers

/**
 * Created by alberto on 9/07/15.
 */
class CustomObjectMarshallers {
    List marshallers = []

    def register() {
        marshallers.each { it.register() }
    }

}
