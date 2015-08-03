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
                    question        : answer.question,
                    image           : answer.image,
                    typeAnswer      : answer.typeAnswer,
                    questionName    : answer.question.getText(),
                    sectionName      : answer.question.getSection().getName()
            ]
        }
    }
}
