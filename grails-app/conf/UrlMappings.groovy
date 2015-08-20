class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/2706Administracion"(view: "/index")
        "500"(view: '/error')
        "/"(view: '/registro')
        "/registro"(view: '/registro')

        "/examen/menu"(view: "testStudent/menu", controller: "testStudent", action: "menu")
        "/examen/menu/enrolment"(controller: "testStudent", action: "enrolment")
        "/examen/menu/$tk"(view: "testStudent/menu", controller: "testStudent", action: "menu")
        "/examen/error/"(view: "testStudent/error")
        "/examen"(view: "testStudent/index", controller: "testStudent", action: "index")
        
        "/examen/resultado/$id"(view: "testStudent/resultado", controller: "testStudent", action: "resultado")

        "/examen/question/$id"(view: "testStudent/question", controller: "testStudent", action: "pregunta")
        "/examen/finalizar/$id"(controller: "testStudent", action: "finalizar")
        "/examen/resultado/"(view: "testStudent/resultado")
    }
}
