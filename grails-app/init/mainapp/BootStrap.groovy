package mainapp


class BootStrap {

    def init = { servletContext ->

        if (!User.count()) {
            User user = new User()
            user.firstName = "Vishrut"
            user.lastName = "Sacheti"
            user.password = "Vishu@12"
            user.email = "vishu@gmail.com"
            user.userName = "vishu"
            user.confirmPassword = "Vishu@12"
            user.admin = true
            user.active = true
            user.save(flush: true)
        }
        def destroy = {
        }
    }
}