package mainapp


class ProfileController {

    static defaultAction = "show"

    ProfileService profileService

    def show(){
        render(view:"/editProfile/show")
    }
    def updateInfo(){
        boolean update = profileService.updateInfo(params,session,flash)
        redirect(controller:"dashboard", action:"show")
    }
    def userProfile(){
        Map model = profileService.userProfile(session)
        render(view: "/userProfile/show",model: model)
    }
    def changePassword(){
        boolean password = profileService.changePassword(params,session,flash)
        password? redirect(controller:"dashboard", action:"show") : redirect(controller:"profile", action:"show")
    }

}
