package mainapp

import javax.servlet.http.HttpSession

class LoginController {

    def index() {}

    static defaultAction = "login"

    def login() {
          render(view: "/login/login")

            //render loginService.serviceMethod()
    }
//<-------------------------REGISTER----------------------->
    def persist() {
        User user = new User()
        bindData(user, params, [exclude: ['confirmPassword', 'photo']])
        if(params.photo){
            user.photo = params.photo.bytes
        }
        user.admin = true
        user.active = true
        if (user.validate()) {
            user.save(flush: true, saveOnError: true)
            render(view: "/login/login")
        } else {
            user.errors.allErrors.each {
                flash.message = "Invalid email address"
                redirect(action:"login")
            }
        }
    }

    def log() {

        User val = User.findByEmailAndPassword(params.email, params.password)

        if (val != null) {
            HttpSession session = request.getSession()
            session.setAttribute("userFirstName"  , val.firstName)
            session.setAttribute("userLastName"  , val.lastName)
            session.setAttribute("userUserName"  , val.userName)
            String encoded = Base64.getEncoder().encodeToString(val.photo)
            session.setAttribute("userPhoto",encoded)
            render(view: "dashboard")
        } else {
            flash.error = "Invalid username or Password"
            redirect(action:"login")
        }

    }
}
