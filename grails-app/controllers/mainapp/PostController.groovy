package mainapp

import MainApp.Resource
import MainApp.Subscription
import MainApp.Topic
import MainApp.User
import MainApp.Topic
class PostController {

   def showPost(){
        User user = User.findById(params.userId)
        Topic topic = Topic.findById(params.topicId)
       def trendingTopics = Resource.createCriteria().list(max:5){
           projections{
               count("id","t")
           }
           groupProperty("topic")
           order("t","desc")
       }
       def userSubscriptions = Subscription.createCriteria().list (){
           and{
               inList("user",user)
               order("dateCreated","desc")
           }
       }
       render(view: "/viewPost/post",model:[user:user,topic:topic,list1:trendingTopics,list:userSubscriptions] )
   }
    def viewImage(){
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }

}
