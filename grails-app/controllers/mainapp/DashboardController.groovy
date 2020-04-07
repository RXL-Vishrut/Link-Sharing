package mainapp


import enums.Seriousness
import enums.Visibility
import grails.converters.JSON

class DashboardController {

    static defaultAction = "show"
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    DashboardService dashboardService

    def show() {
        List<ReadingItem> readingItems = dashboardService.fetchSubscribedTopics(session.userId)
        List<Subscription> userSubscriptions = dashboardService.fetchUserSubscriptions(session.userId)
        List<Resource> trendingTopics = dashboardService.fetchTrendingTopics()
        render(view: "/dashboard/show", model: [readingItems: readingItems , userSubscriptions: userSubscriptions, trendingTopics: trendingTopics])
    }

    def viewImage() {
        byte[] imageInByte = dashboardService.viewImage(params.userId)
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
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

        if(topic.visibility.Private == "Private"){
            flash.message = "You have unsubscribed ${topic.name}"
            redirect(controller: "dashboard", action: "show")
        }else{
            flash.message = "You have unsubscribed ${topic.name} Yo"
            redirect(controller: "dashboard", action: "show")
        }

    }

    def subscribe() {
        User user = User.get(session.userId)
        Topic topic = Topic.get(params.topicId)
        List resources = Resource.findAllByTopic(topic)
        if(resources){
            resources.each{
                Resource resource ->
                    ReadingItem readingItem = new ReadingItem(user: user,resource: resource,isRead: false)
                    readingItem.save(flush: true)
            }
        }

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
            readingItem.isRead = true
            readingItem.save(flush: true)
            redirect(controller: "dashboard", action: "show")
        }
    }

}