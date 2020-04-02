package mainapp


class ProfileController {

    static defaultAction = "showProfile"

    def showProfile(){
        User user = User.findByEmail(session.userEmail)
        def subscriptionsOfUser = Subscription.createCriteria().list(){
            projections{count("user")}
            inList("user",user)
        }

        def topicsCreatedByUser = Topic.createCriteria().list(){
            projections{count("createdBy")}
            inList("createdBy",user)
        }

        List l=[]
        l.add(subscriptionsOfUser[0])
        l.add(topicsCreatedByUser[0])

        render(view:"profile",model:[list:l])
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
        User usr = User.findByEmail(session.userEmail)
        if(params.password==params.confirmPassword){
            usr.password = params.password
            usr.save(flush:true,failOnError:true)
            flash.message = "Your password has been updated"
            redirect(controller:"dashboard", action:"show")
        }else{
            flash.message = "Password didn't matched"
            redirect(controller:"profile", action:"showProfile")
        }

    }


    
}