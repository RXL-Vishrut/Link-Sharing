package mainapp

import grails.converters.JSON

import javax.servlet.http.HttpSession

class LoginController {

    static defaultAction = "home"

    def home() {
        List<Topic> publicTopics = Topic.findAllByVisibility(enums.Visibility.Public.name())
        List<Resource> recentShares = []
        if (publicTopics) {
            recentShares = Resource.createCriteria().list(sort: "lastUpdated", order: "desc") {
                inList("topic", publicTopics)
            }
        }
        List topPosts = []
        topPosts = ResourceRating.createCriteria().list(max: 5) {
            order "score", "desc"
        } ?: []
        render(view: "/login/homePage", model: [recentlySharedResource: recentShares, topPosts: topPosts])
    }


    def error() {
        List<Topic> publicTopics = Topic.findAllByVisibility(enums.Visibility.Public.name())
        List<Resource> recentShares = Resource.createCriteria().list(sort: "lastUpdated", order: "desc") {
            inList("topic", publicTopics)
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
        user.active = true
        user.admin = false
        session.userId = user.id
        session.userUserName = user.userName
        session.userIsAdmin = user.admin
        session.userFirstName = user.firstName
        session.userLastName = user.lastName
        session.userEmail = user.email
        if (user.photo) {
            String encoded = Base64.getEncoder().encodeToString(user.photo)
            session.setAttribute("userPhoto", encoded)
        }

        if (user.validate()) {
            user.save(flush: true, failOnError: true)
            flash.message = "User registered successfully"
            redirect(controller: "login", action: "home")
        } else {
            user.errors.allErrors.each {
                println(it)
                flash.message = "Try with different username/email"
            }
            redirect(action: "home")
        }
    }

    def login() {
        User user = User.createCriteria().get {
            or {
                and {
                    eq("userName", params.userName)
                    eq("password", params.password)
                }
                and {
                    eq("email", params.userName)
                    eq("password", params.password)
                }
            }
        }
        if (user) {
            if (user.active) {
                session.userId = user.id
                session.userUserName = user.userName
                session.userIsAdmin = user.admin
                session.userFirstName = user.firstName
                session.userLastName = user.lastName
                session.userEmail = user.email
                if(user.photo){
                    String encoded = Base64.getEncoder().encodeToString(user.photo)
                    session.setAttribute("userPhoto", encoded)
                }

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
                text "http://localhost:9090/login/resetPassword?userId${user.id}"
            }
            render([success: true] as JSON)
        } else {
            render([success: false] as JSON)
        }
    }

    def resetPassword() {
        render(view: "/login/resetpassword")

    }

    def changePassword() {
        User user = User.findById(params.userId)
        if (user) {
            user.password = params.password
            user.save(flush: true, failOnError: true)
            println("saved")
            render ([success: true] as JSON)
        }else{
            render([success: false] as JSON)
        }

    }

}

