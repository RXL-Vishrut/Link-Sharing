package mainapp

import grails.gorm.transactions.Transactional

@Transactional
class PostService {

    LinkResource shareLink(Long userId, Long linkTopic, String link, String linkdescription) {
        User user = User.findById(userId)
        Topic topic = Topic.findById(linkTopic)
        LinkResource linkResource = new LinkResource(url: link, description: linkdescription, createdBy: user, topic: topic)
        return linkResource.save(flush: true)
    }

//    DocumentResource shareDoc(Long userId, Long linkTopic, String docdescription,String document) {
//        User user = User.findById(userId)
//        Topic topic = Topic.findById(linkTopic)
//        if (topic) {
//            def file1 = request.getFile("document")
//            String dir1 = new Date()
//            String dir2 = dir1.split(" ").join("")
//            String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
//            file1.transferTo(new File(dir))
//            DocumentResource documentResource = new DocumentResource(filePath: dir, description: docdescription, createdBy: user, topic: topic)
//            return documentResource.save(flush: true, failOnError: true)
//        }
//    }
}
