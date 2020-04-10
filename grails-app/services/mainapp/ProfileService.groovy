package mainapp

import grails.gorm.transactions.Transactional

@Transactional
class ProfileService {

    def updateInfo(params,session,flash) {
        User user = User.findByEmail(session.userEmail)
        if(user){
            user.firstName = params.firstName
            user.lastName = params.lastName
            user.userName = params.userName
            user.photo = params.photo.bytes
            session.userFirstName = params.firstName
            session.userLastName = params.lastName
            session.userUserName = params.userName
            String encoded = Base64.getEncoder().encodeToString(params.photo.bytes)
            session.setAttribute("userPhoto", encoded)
            user.save(flush:true)
            flash.message = "Profile Updated"
            return true
        }else{
            flash.message = "Profile cannot be Updated"
            return false
        }
    }
    Map userProfile(session){
        User user = User.findByEmail(session.userEmail)
        List<Resource> postsOfUser = Resource.findAllByCreatedBy(user)
        List<Topic> topicsCreatedByUser = Topic.createCriteria().list(max:5){
            eq("createdBy",user)
            eq("visibility",enums.Visibility.Public)
            order("lastUpdated","desc")
        }
        List<Subscription> subscriptionsOfUser = Subscription.findAllByUser(user)
        return [postsOfUser:postsOfUser ,topicsCreatedByUser:topicsCreatedByUser,subscriptionsOfUser:subscriptionsOfUser]
    }

    boolean changePassword(params,session,flash){
        User user = User.findByEmail(session.userEmail)
        if(params.password == params.confirmPassword){
            user.password = params.password
            user.save(flush:true,failOnError:true)
            flash.message = "Your password has been updated"
            return true
        }else{
            flash.message = "Password didn't matched"
            return false
        }
    }
}
