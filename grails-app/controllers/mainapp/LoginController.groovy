package mainapp

import grails.converters.JSON

import javax.servlet.http.HttpSession

class LoginController {

    static defaultAction = "home"

    def home() {
        List<Topic> PublicTopics = Topic.findAllByVisibility("Public")
        List<Resource> recentShares = Resource.createCriteria().list(sort: "lastUpdated", order: "desc") {
            inList("topic", PublicTopics)
        }
        List<ResourceRating> topPosts = ResourceRating.createCriteria().list(max: 5) {
            order "score", "desc"
        }
        render(view: "/login/homePage", model: [recentlySharedResource: recentShares, topPosts: topPosts])
    }


    def error() {
        List<Topic> PublicTopics = Topic.findAllByVisibility("Public")
        List<Resource> recentShares = Resource.createCriteria().list(sort: "lastUpdated", order: "desc") {
            inList("topic", PublicTopics)
        }

        flash.message = "You must login first"
        redirect(controller: "login", action: "home", model: [recent: recentShares])
    }

    def viewImage() {
        User user = User.get(params.userId)
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
            redirect(controller: "dashboard", action: "show")
        } else {
            user.errors.allErrors.each {
                flash.message = "Invalid email address"
                redirect(action: "home")
            }
        }
    }

    def login() {
        User user = User.findByEmailAndPassword(params.email, params.password)
        if (user) {
            if (user.active) {
                HttpSession session = request.getSession()
                session.setAttribute("userFirstName", user.firstName)
                session.setAttribute("userLastName", user.lastName)
                session.setAttribute("userUserName", user.userName)
                session.setAttribute("userEmail", user.email)
                session.setAttribute("userId", user.id)
                session.setAttribute("userIsAdmin", user.admin)
                String encoded = Base64.getEncoder().encodeToString(user.photo)
                session.setAttribute("userPhoto", encoded)
                redirect(controller: "dashboard", action: "show")
            } else {
                flash.message = "User has been deactivated"
                redirect(action: "home")
            }
        } else {
            flash.message = "Invalid username or Password"
            redirect(action: "home")
        }
    }

    def forgotPassword() {
        String email = params.emailForgot
        User user = User.findByEmail(email)
        if (user) {
            sendMail {
                to params.emailForgot
                subject "Reset password"
                text "http://localhost:9090/login/resetPassword?userId=${user.id}"
            }
            render([success: true] as JSON)
        } else {
            render([success: false] as JSON)
        }
    }

    def resetPassword() {
        render(view: "/login/resetpassword")

    }
    def changePassword(){
        User user = User.findById(params.userId)
        if(user){
            user.password = params.password
            user.save(flush:true , failOnError:true)
            return([success:true] as JSON)
        }
        render([success:true] as JSON)
    }
}

