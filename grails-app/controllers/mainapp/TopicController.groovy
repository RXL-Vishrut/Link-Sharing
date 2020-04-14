package mainapp

import enums.Seriousness
import grails.converters.JSON

class TopicController {

    static defaultAction = "show"

    TopicService topicService
    PostService postService
    EmailService emailService

    def show() {
        Map model = topicService.fetchTopicDetail(session.userId, Long.valueOf(params.topicId))
        render(view: "/topic/show", model: model)
    }
    def create() {
        Topic topic = topicService.createTopic(session.userEmail, params.name, params.visibility)
        render([success: topic ? true : false] as JSON)
    }
    def delete() {
        Topic topic = topicService.deleteTopic(Long.valueOf(params.topicId))
        render([success: topic ? false:true] as JSON)
    }
    def showAllTopics() {
        List<Topic> allTopics = topicService.showAllTopics(session.userId)
        render(view: "showAllTopics", model: [allTopics: allTopics])
    }
    def isRead() {
        boolean isRead = topicService.fetchIsRead(params,session)
        isRead ? render ([success: true] as JSON) : render ([success: false] as JSON)
    }
    def editTopic() {
        boolean editTopic = topicService.edit(params,session)
       render([success:editTopic?:false] as JSON)
    }
    def invite() {
        boolean isSend = emailService.email(params,session)
        render([success:isSend?:false] as JSON)
    }
    def unsubscribe() {
        topicService.doUnsubscribe(session,params,flash)
        redirect(controller: "dashboard", action: "show")
    }

    def subscribe() {
        boolean subscribe = topicService.doSubscribe(session,params,flash)
        if(subscribe){
            redirect(controller: "dashboard", action: "show")
        }
    }
    def search() {
        Map model = topicService.search(params)
        render(view: "/search/searchPage", model: model)
    }

    def subTopicSeriousness(){
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.topicId)
        Subscription subscription = Subscription.findByUserAndTopic(user, topic)
        subscription.seriousness = params.seriousness
        subscription.save(flush:true)
        render([success:true] as JSON)
    }

    def showAllSubscription() {
        User user = User.findById(params.userId)
        List<Subscription> allSubscriptions = Subscription.findAllByUser(user)
        render(view: "/userProfile/showAllSubscription", model: [allSubscriptions: allSubscriptions])
    }
}
