package mainapp


import enums.Seriousness
import enums.Visibility
import grails.converters.JSON

class DashboardController {

    static defaultAction = "show"
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def show() {
        User user = User.findByEmail(session.userEmail)
        List<Resource> resources
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)?.topic
        if(subscribedTopics){
            resources = Resource.createCriteria().list() {
                'in'("topic.id", subscribedTopics?.id)
                ne("createdBy.id", user.id)
            }
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

        render(view: "/dashboard/show", model: [resources: resources, userSubscriptions: userSubscriptions, user: user, trendingTopics: trendingTopics])
    }

    def viewImage() {
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()
    }


    def shareLink() {
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.linkTopic)
        LinkResource lr = new LinkResource(url: params.link, description: params.linkdescription, createdBy: user, topic: topic)
        lr.save(flush: true, failOnError: true)
        flash.message = "Link has been added successfully"
        redirect(controller: "dashboard", action: 'show')
    }


    def shareDoc() {
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.linkTopic)
        if(topic){
            def file1 = request.getFile("document")
            String dir1 = new Date()
            String dir2 = dir1.split(" ").join("")
            String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
            file1.transferTo(new File(dir))
            DocumentResource dr = new DocumentResource(filePath: dir, description: params.docdescription, createdBy: user, topic: topic)
            dr.save(flush: true, failOnError: true)
            flash.message = "Document has been added successfully"
            redirect(controller: "dashboard", action: 'show')
        }else{
            flash.message = "Document cannot be added"
            redirect(controller: "dashboard", action: 'show')
        }

    }

    def invite() {
        sendMail {
            to params.address
            subject params.subject
            text params.body
        }

        flash.message = "Message sent to " + params.address + " at " + new Date()
        redirect action: "show"
    }


    def unsubscribe() {
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.topicId)
        Subscription subscription = Subscription.findByUserAndTopic(user, topic)
        subscription.delete(failOnError: true, flush: true)
        flash.message = "You have unsubscribed ${topic.name}"
        redirect(controller: "dashboard", action: "show")
    }

    def subscribe() {
        User user = User.get(session.userId)
        Topic topic = Topic.get(params.topicId)
        Subscription subscription = new Subscription(user: user, topic: topic, seriousness: Seriousness.Very_Serious.name())
        subscription.save(flush: true)
        flash.message = "You have been subscribed to ${topic.name}"
        redirect(controller: "dashboard", action: "show")
    }

    def download() {
        DocumentResource documentResource = DocumentResource.get(params.postId)
        File file = new File(documentResource.filePath)
        byte[] orderPDF = file.bytes      //getBytes()
        response.setHeader("Content-disposition", "attachment; filename=" + file.name)
        response.contentType = "application/octet-stream"  //file-mime-type
        response.contentLength = orderPDF.length
        response.outputStream << orderPDF
        response.outputStream.flush()
        response.outputStream.close()

    }

    def isRead() {

        User user = User.get(session.userId)
        Resource resource = Resource.get(params.resourceId)
        ReadingItem readingItem = ReadingItem.findByUserAndResource(user, resource)
        if (readingItem) {
            readingItem.isRead = params.isState
            readingItem.save(flush: true)
            redirect(controller: "dashboard", action: "show")
        } else {
            ReadingItem readItem = new ReadingItem(user: user, resource: resource, isRead: params.isState)
            readItem.save(flush: true, failOnError: true)
            redirect(controller: "dashboard", action: "show")
        }

    }

}