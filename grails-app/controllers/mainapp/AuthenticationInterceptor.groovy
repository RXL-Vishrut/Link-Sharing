package mainapp


class AuthenticationInterceptor {
    AuthenticationInterceptor() {
        matchAll().excludes(controller: "login")
    }

    boolean before() {
        if (!session.userId) {
            flash.message = "Please login"
            redirect(controller: "login", action: "home")
            return false
        }
        true
    }

    boolean after() {
//        if (!session.userId) {
//            flash.message = "Please login"
//            redirect(controller: "login", action: "home")
//            return false
//        }
        true
    }

    void afterView() {
        // no-op
    }
}
