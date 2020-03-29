package mainapp

import MainApp.DocumentResource
import MainApp.Resource
import MainApp.Subscription
import MainApp.Topic
import MainApp.User
import MainApp.LinkResource
import enums.Seriousness

class DashboardController {

    static defaultAction = "subscribedTopics"

    def subscribedTopics(){
        User user = User.findByEmail(session.userEmail)
        def subscribed =Subscription.createCriteria().list (max:5){
            and{
                inList("user",user)
                order("dateCreated","desc")
            }
        }
        render(view: "/dashboard/dashboard",model: [list:subscribed])
    }

    def shareLink() {

        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.linkTopic)
        Resource resource = Resource.findByTopicAndCreatedBy(topic,user)
        if(resource==null){
            println(params)
            Resource res = new Resource(description: params.linkdescription, createdBy: user, topic: topic)
            LinkResource lr = new LinkResource(description: params.linkdescription, url:params.link)
            res.addToLinkResource(lr)
            res.save(flush: true, failOnError: true)
            flash.message = "Your link resource has been added"
        }
        else{
            LinkResource lr = new LinkResource(description: params.linkdescription, url:params.link)
            //resource.properties = params
            resource.addToLinkResource(lr)
            resource.save(flush: true, failOnError: true)
            flash.message = "Your link resource has been added"
        }
        redirect(controller:"dashboard",action: 'subscribedTopics')
    }


    def shareDoc() {
        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.docTopic)
        Resource resource = Resource.findByTopicAndCreatedBy(topic, user)
        def file1 = request.getFile("document")
        String dir1 = new Date()
        String dir2 = dir1.split(" ").join("")
        String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
        file1.transferTo(new File(dir))
        if (resource == null) {
            Resource res = new Resource(description: params.docdescription, createdBy: user, topic: topic)
            DocumentResource dr = new DocumentResource(filePath: dir, description: params.docdescription)
            res.addToDocumentResource(dr)
            res.save(flush: true, failOnError: true)
            flash.message = "Your document resource has been added"
        } else {
            DocumentResource dr = new DocumentResource(filePath: dir, description: params.docdescription)
            resource.addToDocumentResource(dr)
            resource.save(flush: true, failOnError: true)
            flash.message = "Your document resource has been added"
        }
        redirect(controller:"dashboard",action: 'subscribedTopics')
    }

    def send() {
        sendMail {
            to params.address
            subject params.subject
            text params.body
        }

        flash.message = "Message sent to " + params.address + " at " + new Date()
        redirect action: "subscribedTopics"
    }


    def createTopic() {
        Topic topic = Topic.findByName(params.name)
        User user = User.findByEmail(session.getAttribute("userEmail"))
        if (topic != null && topic.createdBy==user) {
                flash.message = "Already created topic by this name"
                redirect(controller: "dashboard" , action: "subscribedTopics")
        } else {
            Topic t = new Topic()
            bindData(t, params, [exclude: ['createdBy']])
            Subscription sub = new Subscription(user: user, topic: t,seriousness: Seriousness.Very_Serious.name())
            t.createdBy = user
            .addToSubscriptions(sub)
            t.save(flush: true, failOnError: true)
            flash.message = "Topic created"
            redirect(controller: "dashboard", action: "subscribedTopics")
        }
    }

    def unsubscribe(){
        User user = User.get(params.userId)
        Topic topic = Topic.get(params.topicId)
        if(topic.createdBy == user){
            flash.message = "You cannot unsubscribe this topic"
            redirect(controller: "dashboard" , action: subscribedTopics())
        }else{
            Subscription sub = Subscription.findByUserAndTopic(user,topic)
            Topic t = Topic.findAllByCreatedByAndName(user,topic)
            t.delete(failOnError: true,flush: true)
            sub.delete(failOnError: true,flush:true)
            flash.message = "You have unsubscribed ${sub.topic}"
            redirect(controller: "dashboard" , action: subscribedTopics())
        }

    }

}