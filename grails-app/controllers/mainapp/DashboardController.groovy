package mainapp

import MainApp.DocumentResource
import MainApp.Resource
import MainApp.Subscription
import MainApp.Topic
import MainApp.User
import MainApp.LinkResource
import enums.Seriousness
import enums.Visibility
import grails.converters.JSON

class DashboardController {

    static defaultAction = "subscribedTopics"

    def subscribedTopics(){

        User user = User.findByEmail(session.userEmail)
        List PublicTopicsNotCreatedByUser = Topic.createCriteria().list(){
            and{
                not{'in'("createdBy",user)}
                eq("visibility", Visibility.Public)
            }
        }
//        <----------------subscriptions------------------->
        def userSubscriptions = Subscription.createCriteria().list (){
            and{
                inList("user",user)
                order("dateCreated","desc")
            }
        }
//        <----------------photo sub---------------------->
        def subscriptionsOfUser = Subscription.createCriteria().list(){
            projections{count("user")}
            inList("user",user)
        }

        def topicsCreatedByUser = Topic.createCriteria().list(){
            projections{count("createdBy")}
            inList("createdBy",user)
        }

        List l=[]
        l.add(subscriptionsOfUser[0])
        l.add(topicsCreatedByUser[0])

        def trendingTopics = Resource.createCriteria().list (max:5){
            projections{
                count("id","t")
            }
            groupProperty("topic")
            order("t","desc")
        }

        render(view: "/dashboard/dashboard",model: [list:userSubscriptions,list1:trendingTopics,list2:l,list3:PublicTopicsNotCreatedByUser])
    }

    def viewImage(){
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()
    }


    def shareLink() {

        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.linkTopic)
        LinkResource lr = new LinkResource(url: params.link,description: params.linkdescription,createdBy: user ,topic :topic)
        lr.save(flush:true , failOnError:true)
        flash.message = "Link has been added successfully"
        redirect(controller:"dashboard",action: 'subscribedTopics')
    }


    def shareDoc() {
        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.docTopic)
        def file1 = request.getFile("document")
        String dir1 = new Date()
        String dir2 = dir1.split(" ").join("")
        String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource dr = new DocumentResource(filePath: dir,description:params.docdescription,createdBy:user,topic:topic)
        dr.save(flush:true , failOnError:true)
        flash.message = "Document has been added successfully"
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
//                flash.message = "Already created topic by this name"
//                redirect(controller: "dashboard" , action: "subscribedTopics")
            render([success:false] as JSON)
        } else {
            Topic t = new Topic()
            println(params)
            bindData(t, params, [exclude: ['createdBy']])
            Subscription sub = new Subscription(user: user, topic: t,seriousness: Seriousness.Very_Serious.name())
            t.createdBy = user
            .addToSubscriptions(sub)
            t.save(flush: true, failOnError: true)
            //flash.message = "Topic created"
            //redirect(controller: "dashboard", action: "subscribedTopics")
            render ([success:true] as JSON)
        }
    }

    def unsubscribe(){
        User user = User.findById(params.userId)
        Topic topic = Topic.findById(params.topicId)
        println(user.id)
        println(topic.id)
        Subscription sub = Subscription.findByUserAndTopic(user,topic)
        sub.delete(failOnError: true,flush:true)
        flash.message = "You have unsubscribed ${topic.name}"
        redirect(controller: "dashboard" , action: "subscribedTopics")


    }

    def subscribe(){
        User user = User.get(params.userId)
        println(user.id)
        Topic topic = Topic.get(params.topicId)
        println(topic.id)
        Subscription sub = new Subscription(user: user, topic: topic,seriousness: Seriousness.Very_Serious.name())
        sub.save(flush:true)
        flash.message = "You have been subscribed to ${topic.name}"
        redirect(controller: "dashboard" ,action: "subscribedTopics")
    }

}