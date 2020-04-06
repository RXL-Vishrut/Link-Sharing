package mainapp

import enums.Seriousness
import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {
    Map fetchTopicDetail(Long userId, Long topicId) {
        User user = User.findById(userId)
        Topic topic = Topic.findById(topicId)
        List<User> subscribedUsers = Subscription.findAllByTopic(topic)*.user
        List<Resource> postsOfTopic = Resource.findAllByTopic(topic)
        return [subscribedUsers: subscribedUsers, postsOfTopic: postsOfTopic, topic: topic, user: user]
    }

    Topic createTopic(String userEmail, String topicName, String visibility){
        User user = User.findByEmail(userEmail)
        if (Topic.countByCreatedByAndName(user,topicName)) {
            return null
        } else {
            Topic topic = new Topic(name: topicName, createdBy: user, visibility: visibility)
            Subscription subscription = new Subscription(user: user, topic: topic, seriousness: Seriousness.Very_Serious.name())
            topic.addToSubscriptions(subscription)
            return topic.save(flush: true)
        }
    }
}
