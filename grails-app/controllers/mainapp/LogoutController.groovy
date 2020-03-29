package mainapp

import javax.servlet.http.HttpSession

class LogoutController {

    def index() {
        //HttpSession session = request.getSession(false)
//        if(session!=null){

//        }else{
//            flash.message = "Please login again"
//            redirect(controller: "login", view:"homePage" )
//        }


    }
    def logout(){
        session.invalidate()
        flash.message = "Logout Successfully"
        redirect(controller:"login", action:"home")
    }

}
