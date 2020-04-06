package mainapp


class ProfileController {

    static defaultAction = "show"

    def show(){
        render(view:"/editProfile/show")
    }
    def updateInfo(){
        User user = User.findByEmail(session.userEmail)
        user.firstName = params.firstName
        user.lastName = params.lastName
        user.userName = params.userName
        user.photo = params.photo.bytes
        session.userFirstName = params.firstName
        session.userLastName = params.lastName
        session.userUserName = params.userName
        String encoded = Base64.getEncoder().encodeToString(params.photo.bytes)
        session.setAttribute("userPhoto", encoded)
        user.save(flush:true,failOnError:true)
        flash.message = "Information Updated"
        redirect(controller:"dashboard", action:"show")
    }
    def changePassword(){
        User user = User.findByEmail(session.userEmail)
        if(params.password==params.confirmPassword){
            user.password = params.password
            user.save(flush:true,failOnError:true)
            flash.message = "Your password has been updated"
            redirect(controller:"dashboard", action:"show")
        }else{
            flash.message = "Password didn't matched"
            redirect(controller:"profile", action:"show")
        }

    }
    def userProfile(){
        User user = User.findByEmail(session.userEmail)
        List<Resource> postsOfUser = Resource.findAllByCreatedBy(user)
        List<Topic> topicsCreatedByUser = Topic.createCriteria().list(max:5){
            eq("createdBy",user)
            eq("visibility",enums.Visibility.Public)
            order("lastUpdated","desc")
        }
        List<Subscription> subscriptionsOfUser = Subscription.findAllByUser(user)
        render(view: "/userProfile/show",model: [postsOfUser:postsOfUser ,topicsCreatedByUser:topicsCreatedByUser,subscriptionsOfUser:subscriptionsOfUser])
    }
}
