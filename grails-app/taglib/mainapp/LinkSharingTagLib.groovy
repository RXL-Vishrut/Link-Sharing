package mainapp

class LinkSharingTagLib {
//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"

    def subscriptionCount = { Map attributes->
        if(attributes.userId){
            User user = User.get(attributes.userId)
            Integer numberOfTopicsForUser = Subscription.countByUser(user)
            out << numberOfTopicsForUser
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
        out << numberOfTopicsCreated
    }

    def postCount = { Map attributes->
        Topic topic = Topic.get(attributes.topicId)
        Integer numberOfPosts = Resource.countByTopic(topic)
        out << numberOfPosts
    }
}

