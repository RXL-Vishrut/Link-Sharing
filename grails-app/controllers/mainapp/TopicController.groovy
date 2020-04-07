package mainapp

import enums.Seriousness
import grails.converters.JSON


class TopicController {
    static defaultAction = "show"

    TopicService topicService

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
    def view(){
        List<Topic> viewAll = topicService.showAllTopics(session.userId)
        render(view: "showAllTopics", model: [allTopics: viewAll])
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

    def search() {
        List<Resource> trendingTopics = Resource.createCriteria().list(max: 5) {
            projections {
                count("id", "count")
            }
            groupProperty("topic")
            order("count", "desc")
        }
        List<ResourceRating> topPosts = ResourceRating.createCriteria().list(max: 5) {
            order "score", "desc"
        }

        List<Topic> topics = Topic.findAllByNameIlike(params.searchText) ?: []
        List<Resource> resources = Resource.findAllByDescriptionIlike(params.searchText)?: []
        render(view: "/search/searchPage", model: [trendingTopics: trendingTopics, topPosts: topPosts, resources: resources, topics:topics])
    }

    def showAllSubscription() {
        User user = User.findById(params.userId)
        List<Subscription> allSubscriptions = Subscription.findAllByUser(user)
        render(view: "/userProfile/showAllSubscription", model: [allSubscriptions: allSubscriptions])

    }

}
