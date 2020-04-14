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
        println(user.firstName)
        if(user.admin == false){
            println("yooooo")
            user.admin = true
            user.save(flush:true)
            render([success:true] as JSON)
        }else{
            println("No")
            user.admin = false
            user.save(flush:true)
            render([success:false] as JSON)
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
