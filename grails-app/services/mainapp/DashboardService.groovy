package mainapp

import grails.gorm.transactions.Transactional

@Transactional
class DashboardService {
    byte [] viewImage(Long userId){
        User user = User.findById(userId)
        byte[] imageInByte = user.photo
        return imageInByte
    }
}
