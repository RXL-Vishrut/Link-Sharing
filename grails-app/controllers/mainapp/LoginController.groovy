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

    def register() {
        User user = new User()
        bindData(user, params, [exclude: ['confirmPassword', 'photo']])
        if (params.photo) {
            user.photo = params.photo.bytes
        }
        user.active = true
        user.admin = false
        boolean registerUser = loginService.register(user,flash,session)
        if(registerUser){
            redirect(controller: "dashboard", action: "show")
        }else{
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
        boolean forgotPassword = loginService.forgotPasswordEmail(params)
        render([success: forgotPassword?:false] as JSON)
    }

    def resetPassword() {
        Map model = loginService.resetPassword(params)
        if(model){
            render(view: "/login/resetpassword", model:model)
        }else{
            render(view: "/login/homePage")
        }
    }

    def changePassword() {
        boolean changePassword = loginService.changePassword(params)
        render([success:changePassword?:false] as JSON)
    }

//    void initializeSession(User user) {
//        session.userId = user.id
//        session.userUserName = user.userName
//        session.userIsAdmin = user.admin
//        session.userFirstName = user.firstName
//        session.userLastName = user.lastName
//        session.userEmail = user.email
//        if (user.photo) {
//            String encoded = Base64.getEncoder().encodeToString(user.photo)
//            session.setAttribute("userPhoto", encoded)
//        }
//    }
}

