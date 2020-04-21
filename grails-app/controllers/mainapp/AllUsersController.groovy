package mainapp

import grails.converters.JSON


class AllUsersController {

    static defaultAction = "userDetails"
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def userDetails(){
        List<User> users = User.list()
        render(view: "/allUsers/sysUser",model: [users:users])
    }
    def changeAdminStatus(){
        User user = User.findById(params.userId)
        if(user.admin == false){
            user.admin = true
            user.save(flush:true)
            render([isAdmin:true, userId:params.userId] as JSON)
        }else{
            user.admin = false
            user.save(flush:true)
            render([isAdmin: false, userId:params.userId] as JSON)
        }
    }

    def changeActiveStatus(){
        User users=User.get(params.userId)
        println(params)
        if (users.active == false) {
            users.active = true
            users.save(flush: true, failOnError: true)
        } else {
            users.active = false
            users.save(flush: true, failOnError: true)
        }
        redirect(action: "userDetails", controller: "allUsers")
    }
}
