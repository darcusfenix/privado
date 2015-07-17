import com.ed.schoolmanagement.marshallers.ClassroomMarshaller
import com.ed.schoolmanagement.marshallers.CustomObjectMarshallers
import com.ed.schoolmanagement.marshallers.UserMarshaller

// Place your Spring DSL code here
beans = {
    customObjectMarshallers(CustomObjectMarshallers) {
        marshallers = [
                new UserMarshaller(),
                new ClassroomMarshaller()
        ]
    }

}
