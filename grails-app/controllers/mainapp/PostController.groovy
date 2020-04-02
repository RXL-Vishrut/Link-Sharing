package mainapp

import grails.converters.JSON

class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
   def show(){
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

    def shareLink() {
        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.linkTopic)
        LinkResource lr = new LinkResource(url: params.link,description: params.linkdescription,createdBy: user ,topic :topic)
        lr.save(flush:true , failOnError:true)
        flash.message = "Link has been added successfully"
        redirect(controller:"topic",action: 'show')
    }


    def shareDoc() {
        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.docTopic)
        def file1 = request.getFile("document")
        String dir1 = new Date()
        String dir2 = dir1.split(" ").join("")
        String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource dr = new DocumentResource(filePath: dir,description:params.docdescription,createdBy:user,topic:topic)
        dr.save(flush:true , failOnError:true)
        flash.message = "Document has been added successfully"
        redirect(controller:"topic",action: 'show')
    }

}
