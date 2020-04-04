package mainapp

import enums.Seriousness
import grails.converters.JSON


class TopicController {
    static defaultAction = "show"

    TopicService topicService

    def show() {
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.topicId)
        List<User> subscribedUsers = Subscription.findAllByTopic(topic)*.user
        List<Resource> postsOfTopic = Resource.findAllByTopic(topic)
        render(view: "/topic/show", model: [subscribedUsers: subscribedUsers, postsOfTopic: postsOfTopic, topic: topic, user: user])
    }

    def create() {
        Topic topic = Topic.findByName(params.name)
        User user = User.findByEmail(session.userEmail)

        if (topic != null && topic.createdBy == user) {
            render([success: false] as JSON)
        } else {
            Topic newTopic = new Topic(name: params.name, createdBy: user, visibility: params.visibility)
            println(newTopic.properties)
            Subscription sub = new Subscription(user: user, topic: newTopic, seriousness: Seriousness.Very_Serious.name())
            newTopic.addToSubscriptions(sub)
            newTopic.save(flush: true, failOnError: true)
            render([success: true] as JSON)
        }
    }

    def editTopic() {
        Topic topic = Topic.findBy(params.topicId)
        User currentUser = User.findById(session.userId)
        Subscription subscription = Subscription.findByUserAndTopic(currentUser, topic)
        topic.name = params.topicName
        topic.visibility = params.visibility
        subscription.seriousness = params.seriousness
        topic.save(flush: true)
        subscription.save(flush: true)
        render([success: true] as JSON)
    }


}
