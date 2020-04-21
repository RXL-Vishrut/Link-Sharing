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
        boolean loginUser = loginService.login(params,flash,session)
        if(loginUser){
            redirect(controller: "dashboard", action: "show")
        }else{
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
}

