package mainapp

import MainApp.User

class AllUsersController {

    static defaultAction = "userDetails"

    def userDetails(){
        def users = User.list()
        println(users)
        render(view: "/allUsers/sysUser",model: [list:users])
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
