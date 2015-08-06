import com.ed.classroomcourse.Class
import com.ed.schoolmanagement.marshallers.AnswerMarshaller
import com.ed.schoolmanagement.marshallers.ClassMarshaller
import com.ed.schoolmanagement.marshallers.ClassroomMarshaller
import com.ed.schoolmanagement.marshallers.CustomObjectMarshallers
import com.ed.schoolmanagement.marshallers.InductionClassMarshaller
import com.ed.schoolmanagement.marshallers.QuestionMarshaller
import com.ed.schoolmanagement.marshallers.StructureMarshaller
import com.ed.schoolmanagement.marshallers.UserMarshaller

// Place your Spring DSL code here
beans = {
    customObjectMarshallers(CustomObjectMarshallers) {
        marshallers = [
                new UserMarshaller(),
                new ClassroomMarshaller(),
                new InductionClassMarshaller(),
                new ClassMarshaller(),
                new StructureMarshaller(),
                new QuestionMarshaller(),
                new AnswerMarshaller()
        ]
    }

}
