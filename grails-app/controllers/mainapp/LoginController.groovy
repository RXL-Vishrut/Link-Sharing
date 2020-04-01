package mainapp

import enums.Visibility
import MainApp.Resource
import MainApp.User
import MainApp.Topic
import enums.Visibility
import javax.servlet.http.HttpSession

class LoginController {

    static defaultAction = "home"

    def home() {
            def PublicTopics = Topic.findAllByVisibility("Public")
            List<Resource> recentShares = Resource.createCriteria().list(sort:"lastUpdated",order:"desc") {
                inList("topic", PublicTopics)
            }
            render(view: "/login/homePage" , model:[recent : recentShares])
        }
    def error(){
        def PublicTopics = Topic.findAllByVisibility("Public")
        List<Resource> recentShares = Resource.createCriteria().list(sort:"lastUpdated",order:"desc") {
            inList("topic", PublicTopics)
        }

        flash.message = "You must login first"
        render(view: "/login/homePage" , model:[recent : recentShares])
    }

    def viewImage(){
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()
    }



//  <----------------------------------------REGISTER------------------------------------->
    def register() {
        User user = new User()
        bindData(user, params, [exclude: ['confirmPassword', 'photo']])
        if (params.photo) {
            user.photo = params.photo.bytes
        }
        user.admin = true
        user.active = true
        if (user.validate()) {
            user.save(flush: true, failOnError: true)
            flash.message = "User registered successfully"
            redirect(action: "home")
        } else {
            user.errors.allErrors.each {
                flash.message = "Invalid email address"
                redirect(action: "login")
            }
        }
    }

    def login() {
//        MainApp.User val2 = MainApp.User.findByUserNameAndPassword("${params.userid}","${params.password}")
        User val = User.findByEmailAndPassword(params.email, params.password)
        if (val != null) {
            if (val.active == true) {
                HttpSession session = request.getSession()
                session.setAttribute("userFirstName", val.firstName)
                session.setAttribute("userLastName", val.lastName)
                session.setAttribute("userUserName", val.userName)
                session.setAttribute("userUserName", val.userName)
                session.setAttribute("userEmail", val.email)
                session.setAttribute("userId", val.id)
                session.setAttribute("userIsAdmin", val.admin)
                String encoded = Base64.getEncoder().encodeToString(val.photo)
                session.setAttribute("userPhoto", encoded)
                redirect(controller: "dashboard", action: "subscribedTopics")
            } else {
                flash.message = "User has been deactivated"
                redirect(action: "home")
            }
        } else {
            flash.message = "Invalid username or Password"
            redirect(action: "home")
        }
    }

}
