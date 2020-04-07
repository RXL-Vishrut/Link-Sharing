package mainapp

import grails.gorm.transactions.Transactional

@Transactional
class DashboardService {

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
            }
        }
        return readingItems
    }
    List fetchUserSubscriptions(Long userId){
        User user = User.findById(userId)
        List<Subscription> userSubscriptions = Subscription.createCriteria().list() {
            eq("user.id", user.id)
            order("dateCreated", "desc")
        }
        return userSubscriptions
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
    byte [] viewImage(Long userId){
        User user = User.findById(userId)
        byte[] imageInByte = user.photo
        return imageInByte
    }
}
