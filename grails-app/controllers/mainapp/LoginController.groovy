package mainapp

import javax.servlet.http.HttpSession

class LoginController {

    def index() {}

    static defaultAction = "login"

    def login() {
        render(view: "login")
    }

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
            render(view: "login")
        } else {
            user.errors.allErrors.each {
                println it
            }
        }
    }

    def log() {

        User val = User.findByEmailAndPassword(params.email, params.password)
        HttpSession session = request.getSession()
        session.setAttribute("userdetails"  , val.firstName)

        if (val != null) {
            render(view: "dashboard")
        } else {
            flash.error = "Invalid username and Password"
            redirect(action:"login")
        }

    }
}
