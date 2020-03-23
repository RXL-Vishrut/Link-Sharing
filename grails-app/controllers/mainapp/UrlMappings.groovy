package mainapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"Login")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
