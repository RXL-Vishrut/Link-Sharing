package mainapp

class LinkSharingTagLib {
//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"

    def subscriptionCount = { Map attributes->
        if(attributes.userId){
            User user = User.get(attributes.userId)
            Integer numberOfTopicsForUser = Subscription.countByUser(user)
            out << "<a href=${createLink(controller:"profile" , action:"userProfile" , params:[userId:attributes.userId])}>${numberOfTopicsForUser}</a>"

        }
        if(attributes.topicId){
            Topic topic = Topic.get(attributes.topicId)
            Integer numberOfSubscriptionsForTopic = Subscription.countByTopic(topic)
            out << numberOfSubscriptionsForTopic
        }

    }

    def topicCount = { Map attributes->
        User user = User.get(attributes.userId)
        Integer numberOfTopicsCreated = Topic.countByCreatedBy(user)
        out << "<a href=${createLink(controller:"profile" , action:"userProfile" , params:[userId:attributes.userId])}>${numberOfTopicsCreated}</a>"
    }

    def postCount = { Map attributes->
        Topic topic = Topic.get(attributes.topicId)
        Integer numberOfPosts = Resource.countByTopic(topic)
        out << numberOfPosts
    }

    def showSubscribe = { Map attributes->
        User user = User.get(attributes.userId)
        Topic topic = Topic.get(attributes.topicId)
        int isSubscribed =  Subscription.countByUserAndTopic(user,topic)
        String action = isSubscribed ? "unsubscribe" : "subscribe"
        String text = isSubscribed ? "unsubscribe" : "subscribe"
        out << "<a href=${createLink(controller:"dashboard" , action:action , params:[topicId:attributes.topicId])}>${text}</a>"
    }

    def showSubscribedTopics = { Map attributes ->
        User user = User.get(attributes.userId)
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)?.topic
        out << select(from:subscribedTopics ,  optionKey:"id", optionValue:"name", name:"linkTopic")
    }
}

