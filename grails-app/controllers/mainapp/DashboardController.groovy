package mainapp


import enums.Seriousness
import enums.Visibility
import grails.converters.JSON

class DashboardController {

    static defaultAction = "show"
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def show() {
        if(!session.userId){
            redirect(controller: "login" , action: "home")
            return
        }
        User user = User.findByEmail(session.userEmail)
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)*.topic
        List<Resource> resources = Resource.createCriteria().list(){
            'in'("topic.id",subscribedTopics*.id)
            ne("createdBy.id",user.id)

        }
//        <----------------subscriptions------------------->
        List<Subscription> userSubscriptions = Subscription.createCriteria().list() {
            eq("user.id", user.id)
            order("dateCreated", "desc")
        }
        List<Resource> trendingTopics = Resource.createCriteria().list(max: 5) {
            projections {
                count("id", "count")
            }
            groupProperty("topic")
            order("count", "desc")
        }

        render(view: "/dashboard/show", model: [resources: resources, userSubscriptions: userSubscriptions, user: user, trendingTopics: trendingTopics ])
    }

    def viewImage() {
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()
    }


    def shareLink() {

        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.linkTopic)
        LinkResource lr = new LinkResource(url: params.link, description: params.linkdescription, createdBy: user, topic: topic)
        lr.save(flush: true, failOnError: true)
        flash.message = "Link has been added successfully"
        redirect(controller: "dashboard", action: 'show')
    }


    def shareDoc() {
        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.docTopic)
        def file1 = request.getFile("document")
        String dir1 = new Date()
        String dir2 = dir1.split(" ").join("")
        String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource dr = new DocumentResource(filePath: dir, description: params.docdescription, createdBy: user, topic: topic)
        dr.save(flush: true, failOnError: true)
        flash.message = "Document has been added successfully"
        redirect(controller: "dashboard", action: 'show')
    }

    def send() {
        sendMail {
            to params.address
            subject params.subject
            text params.body
        }

        flash.message = "Message sent to " + params.address + " at " + new Date()
        redirect action: "show"
    }


    def unsubscribe() {
        User user = User.findById(params.userId)
        Topic topic = Topic.findById(params.topicId)
        Subscription sub = Subscription.findByUserAndTopic(user, topic)
        sub.delete(failOnError: true, flush: true)
        flash.message = "You have unsubscribed ${topic.name}"
        redirect(controller: "dashboard", action: "show")
    }

    def subscribe() {
        User user = User.get(session.userId)
        Topic topic = Topic.get(params.topicId)
        println(topic.id)
        Subscription sub = new Subscription(user: user, topic: topic, seriousness: Seriousness.Very_Serious.name())
        sub.save(flush: true)
        flash.message = "You have been subscribed to ${topic.name}"
        redirect(controller: "dashboard", action: "show")
    }

    def download() {
        DocumentResource dr = DocumentResource.get(params.postId)
        File file = new File(dr.filePath)
        byte[] orderPDF = file.bytes      //getBytes()
        response.setHeader("Content-disposition", "attachment; filename=" + file.name)
        response.contentType = "application/octet-stream"  //file-mime-type
        response.contentLength = orderPDF.length
        response.outputStream << orderPDF
        response.outputStream.flush()
        response.outputStream.close()

    }

    def isRead() {
        User usr = User.get(params.userId)
        Resource resource = Resource.get(params.resourceId)
        ReadingItem readItem = new ReadingItem(user: usr, resource: resource, isRead: params.value)
        readItem.save(flush: true, failOnError: true)
        render([success: true] as JSON)
    }

}