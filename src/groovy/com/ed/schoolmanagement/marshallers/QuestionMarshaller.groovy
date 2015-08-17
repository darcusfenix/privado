package com.ed.schoolmanagement.marshallers

import com.ed.teststructure.Question
import grails.converters.JSON

class QuestionMarshaller {
    void register() {
        JSON.registerObjectMarshaller(Question) { Question question ->
            return [
                    id         : question.id,
                    number     : question.number,
                    text       : question.text,
                    answer     : question.answer,
                    sectionName: question.section.getName(),
                    section    : question.section,
                    urlImg     : question.urlImage,
                    urlVideo   : question.urlVideo
            ]
        }
    }
}
