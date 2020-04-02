package mainapp

import javax.servlet.http.HttpSession

class LogoutController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def logout(){
        session.invalidate()
        flash.message = "Logout Successfully"
        redirect(controller:"login", action:"home")
    }

}
