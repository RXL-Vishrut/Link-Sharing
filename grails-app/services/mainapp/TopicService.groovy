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
    Topic deleteTopic(Long topicId){
        Topic topic = Topic.findById(topicId)
        return topic.delete(flush: true)
    }

    List<Topic> showAllTopics(Long userId){
        User user = User.findById(userId)
        List<Topic> allTopics = Topic.findAllByCreatedBy(user)
        return allTopics
    }

    boolean edit(params,session){
        Topic topic = Topic.findById(params.topicId)
        User currentUser = User.findById(session.userId)
        Subscription subscription = Subscription.findByUserAndTopic(currentUser, topic)
        topic.name = params.topicName
        topic.visibility = params.visibility
        subscription.seriousness = params.seriousness
        topic.save(flush: true)
        subscription.save(flush: true)
        return true
    }

    boolean doSubscribe(session,params,flash){
        User user = User.get(session.userId)
        Topic topic = Topic.get(params.topicId)
        List resources = Resource.findAllByTopic(topic)
        if (resources) {
            resources.each {
                Resource resource ->
                    ReadingItem readingItem = new ReadingItem(user: user, resource: resource, isRead: false)
                    readingItem.save(flush: true)
            }
        }
        Subscription subscription = new Subscription(user: user, topic: topic, seriousness: Seriousness.Very_Serious.name())
        flash.message = "You have been subscribed to ${topic.name}"
        return subscription.save(flush: true)
    }

    def doUnsubscribe(session,params,flash){
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.topicId)
        if (topic.createdBy == user) {
            flash.message = "You cannot unsubscribe your own topic"
            return
        } else {
            Subscription subscription = Subscription.findByUserAndTopic(user, topic)
            subscription.delete(failOnError: true, flush: true)
            List<Resource> resource = Resource.findAllByTopic(topic)
            resource.each { readingItem ->
                List<ReadingItem> readingItems = ReadingItem.findAllByResourceAndUser(readingItem, user)
                readingItems.each { items ->
                    items.delete(failOnError: true, flush: true)
                }
                flash.message = "You have successfully unsubscribed topic ${subscription.topic.name}"
                return
            }
        }
    }

    List<ReadingItem> fetchSubscribedTopics(Long userId) {
        User user = User.findById(userId)
        List<Resource> resources
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)?.topic
        if(subscribedTopics){
            resources = Resource.createCriteria().list() {
                'in'("topic.id", subscribedTopics?.id)
                ne("createdBy.id", user.id)
            }
        }
        List<ReadingItem> readingItems
        if(resources){
            readingItems = ReadingItem.createCriteria().list() {
                eq("isRead",false)
                'in'("resource.id",resources?.id)
                eq("user.id",user.id)
            }
        }
        return readingItems
    }


    List fetchTrendingTopics(){
        List<Resource> trendingTopics = Resource.createCriteria().list(max: 5) {
            projections {
                count("id", "count")
            }
            groupProperty("topic")
            order("count", "desc")
        }
        return trendingTopics
    }

    List fetchUserSubscriptions(Long userId){
        User user = User.findById(userId)
        List<Subscription> userSubscriptions = Subscription.createCriteria().list() {
            eq("user.id", user.id)
            order("dateCreated", "desc")
        }
        return userSubscriptions
    }

    def fetchRecentShares() {
        List<Topic> publicTopics = Topic.findAllByVisibility(enums.Visibility.Public.name())
        List<Resource> recentShares
        if (publicTopics) {
            recentShares = Resource.createCriteria().list(sort: "lastUpdated", order: "desc") {
                inList("topic", publicTopics)
            } ?: []
        }
        return recentShares
    }
    boolean fetchIsRead(params,session){
        User user = User.get(session.userId)
        Resource resource = Resource.get(params.resourceId)
        if (resource != null) {
            ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource, user)
            readingItem.isRead = true
            readingItem.save(flush: true, failOnError: true)
            return true
        }else{
            return false
        }
    }
    Map search(params){
        def postService
        List<Resource> trendingTopics = fetchTrendingTopics()?:[]
        List<ResourceRating> topPosts = postService.fetchTopPosts()?:[]
        List<Topic> topics = Topic.findAllByNameIlike("%"+params.searchText+"%") ?: []
        List<Resource> resources = Resource.findAllByDescriptionIlike("%"+params.searchText+"%")?: []
        return [trendingTopics:trendingTopics,topPosts:topPosts,resources: resources, topics:topics]
    }
}
