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

        "/examen/menu/"(view: "testStudent/menu", controller: "testStudent", action: "menu")
    }
}