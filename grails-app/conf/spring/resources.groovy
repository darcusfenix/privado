import com.controlescuela.marshallers.CustomObjectMarshallers
import com.controlescuela.marshallers.UserMarshaller

// Place your Spring DSL code here
beans = {
    customObjectMarshallers(CustomObjectMarshallers) {
        marshallers = [
                new UserMarshaller()
        ]
    }

}
