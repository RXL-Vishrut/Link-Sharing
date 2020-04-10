package mainapp

import grails.converters.JSON

class LoginController {

    static defaultAction = "home"

    LoginService loginService
    PostService postService
    TopicService topicService

    def home() {
        if (!session.userId) {
            List<Resource> recentShares = topicService.fetchRecentShares() ?: []
            List<ResourceRating> topPosts = postService.fetchTopPosts() ?: []
            render(view: "/login/homePage", model: [recentlySharedResource: recentShares, topPosts: topPosts])
        } else {
            redirect(controller: "dashboard", action: "show")
        }

    }

    def error() {
        flash.message = "You must login first"
        redirect(controller: "login", action: "home")
    }

    def viewImage() {
        User user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg'
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
        if (user.validate()) {
            user.save(flush: true, failOnError: true)
            initializeSession(user)
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
                initializeSession(user)
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
        println(params)
        User user = User.findByEmail(params.emailForgot)
        String token = UUID.randomUUID().toString().toUpperCase()
        if (user) {
            UserToken invite = new UserToken(userId: user.id, token: token)
            invite.save(flush: true)
            sendMail {
                to params.emailForgot
                subject "Reset password"
                text "http://localhost:9090/login/resetPassword?token=${token}"
            }
            render([success: true] as JSON)
        } else {
            render([success: false] as JSON)
        }
    }

    def resetPassword() {
        UserToken token = UserToken.findByToken(params.token)
        if (token) {
            User user = User.findById(token.userId)
            token.delete(flush: true)
            render(view: "/login/resetpassword", model: [user: user])
        } else {
            render(view: "/login/homePage")
        }
    }

    def changePassword() {
        User user = User.findById(params.userId)
        if (user) {
            user.password = params.password
            user.save(flush: true, failOnError: true)
            render([success: true] as JSON)
        } else {
            render([success: false] as JSON)
        }
    }

    void initializeSession(User user) {
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
    }
}

