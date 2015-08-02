package com.ed.schoolmanagement.marshallers

import com.ed.teststructure.Answer
import grails.converters.JSON

class AnswerMarshaller {
    void register() {
        JSON.registerObjectMarshaller(Answer) { Answer  answer->
            return [
                    id              : answer.id,
                    state           : answer.state,
                    textAnswer      : answer.textAnswer,
                    sectionName     : answer.question.section.name,
                    question        : answer.question,
                    questionName    : answer.question.getText(),
                    image           : answer.image
            ]
        }
    }
}
