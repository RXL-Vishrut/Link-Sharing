package mainapp


class BootStrap {

    def init = { servletContext ->
//        if(!Role.findByAuthority("ROLE_ADMIN")){
//            Role role = new Role()
//            role.authority = "ROLE_ADMIN"
//            if(role.save(flush: true)) {
//                println "Role Created"
//            } else {
//                println "Error in creating role"
//            }
//        } else {
//            println "Role Exists"
//            println MainApp.User.count()
//        }
//        if(!MainApp.User.count()) {
//            MainApp.User user = new MainApp.User()
//            user.username = "Vish"
//            user.password = "Vishu@12"
//            if(user.save(flush: true)){
//                println "MainApp.User created"
//                println "Assigning Role"
//                Role role = Role.findByAuthority("ROLE_ADMIN")
//                UserRole userRole = new UserRole()
//                MainApp.User user1 = MainApp.User.findByUsername("Vishu")
//                userRole.user = user
//                userRole.role = role
//                if(userRole.save(flush: true)) {
//                    println "Role Assigned"
//                } else {
//                    println "Error in assinging role"
//                }
//            } else {
//                println "Error in creating MainApp.User"
//            }
//        } else {
//            println "MainApp.User Exists"
//        }
//        UserRole userRole = new UserRole()
//        MainApp.User user1 = MainApp.User.findByUsername("Vishu")
//        userRole.user = user
//        userRole.role = role
//        if(userRole.save(flush: true)) {
//            println "Role Assigned"
//        } else {
//            println "Error in assinging role"
//        }
        }
        def destroy = {
        }
}