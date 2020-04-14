package mainapp

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.web.databinding.DataBinder

@Transactional
class LoginService {
    boolean register(User user,flash,session){
        if (user.validate()) {
            user.save(flush: true, failOnError: true)
            initializeSession(user,session)
            flash.message = "User registered successfully"
            return true
        } else {
            if(user.errors.getFieldError('userName')){
                flash.message = "Please try with different Username"
            }
            if(user.errors.getFieldError('email')){
                flash.message = "Please try with different Email"
            }
            return false
        }
    }
    void initializeSession(User user,session) {
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
    boolean forgotPasswordEmail(params){
        User user = User.findByEmail(params.emailForgot)
        String token = UUID.randomUUID().toString().toUpperCase()
        if (user) {
            UserToken userToken = new UserToken(userId: user.id, token: token)
            userToken.save(flush: true)
            sendMail {
                to params.emailForgot
                subject "Reset password"
                text "http://localhost:9090/login/resetPassword?token=${token}"
            }
            return true
        } else {
            return false
        }
    }

    Map resetPassword(params){
        UserToken token = UserToken.findByToken(params.token)
        if (token) {
            User user = User.findById(token.userId)
            token.delete(flush: true)
            return [user:user]
        }else{
            return null
        }
    }

    boolean changePassword(params){
        User user = User.findById(params.userId)
        if (user) {
            user.password = params.password
            user.save(flush: true, failOnError: true)
            return true
        } else {
            return false
        }
    }
}
