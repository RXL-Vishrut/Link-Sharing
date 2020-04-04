package mainapp


class AuthLogoutInterceptor {
    AuthLogoutInterceptor() {
        matchAll().excludes(controller: "login", action: "home")
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
