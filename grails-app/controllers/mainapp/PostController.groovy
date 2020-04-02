package mainapp

import grails.converters.JSON

class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
   def showPost(){
        User user = User.findById(params.userId)
        Topic topic = Topic.findById(params.topicId)
       Resource resource = Resource.findById(params.resourceId)
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
       render(view: "/viewPost/post",model:[user:user,topic:topic,resource:resource,list1:trendingTopics,list:userSubscriptions] )
   }
    def viewImage(){
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }
    def rating(){
        Resource resource = Resource.get(params.resourceId)
        User usr = User.get(session.getAttribute("userId"))
        ResourceRating res = ResourceRating.findByUserAndResource(usr,resource)
        if(res){
            println(params.value)
            println(res.score)
            res.score = Integer.parseInt(params.value)
            println(res.score)
            res.save(flush:true , failOnError:true)
            render([success:false] as JSON)
        }else{
            ResourceRating rating = new ResourceRating(score: params.value,user:usr,resource:params.resourceId)
            rating.save(flush:true,failOnError:true)
            render([success:true] as JSON)
        }

    }

}
