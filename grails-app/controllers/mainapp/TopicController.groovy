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
        render(view: "/topic/show", model: [subscribedUsers:subscribedUsers, postsOfTopic:postsOfTopic,topic:topic,user: user])
    }

    def create() {
        Topic topic = Topic.findByName(params.name)
        User user = User.findByEmail(session.getAttribute("userEmail"))
        if (topic != null && topic.createdBy == user) {
            render([success: false] as JSON)
        } else {
            Topic t = new Topic()
            bindData(t, params, [exclude: ['createdBy']])
            Subscription sub = new Subscription(user: user, topic: t, seriousness: Seriousness.Very_Serious.name())
            t.createdBy = user
                    .addToSubscriptions(sub)
            t.save(flush: true, failOnError: true)
            render([success: true] as JSON)
        }
    }

}
