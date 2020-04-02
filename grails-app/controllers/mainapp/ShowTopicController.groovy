package mainapp


class ShowTopicController {
    static defaultAction = "showtopic"

    def showtopic() {
        List<Topic> t = Topic.findAllById(params.topicId)
        def users = Subscription.createCriteria().list() {
            inList("topic", t)
        }
        User user = User.findByEmail(session.userEmail)
        def subscriptionsOfUser = Subscription.createCriteria().list(){
            projections{count("user")}
            inList("user",user)
        }

        def userSubscriptions = Subscription.createCriteria().list (){
            and{
                inList("user",user)
                order("dateCreated","desc")
            }
        }

        def topicsCreatedByUser = Topic.createCriteria().list(){
            projections{count("createdBy")}
            inList("createdBy",user)
        }
        def postOfTopic = Resource.createCriteria().list(){
            inList("topic",t)
        }
        List<User> u =User.findAllById(params.userId)
        List l=[]
        l.add(subscriptionsOfUser[0])
        l.add(topicsCreatedByUser[0])

        render(view: "/showTopic/topic", model: [list:users,list1:l,list2:postOfTopic,list3:u,list4:userSubscriptions])
    }


    def shareLink() {

        User user = User.findByUserName(session.userUserName)
        Topic topic = Topic.findByName(params.linkTopic)
        LinkResource lr = new LinkResource(url: params.link,description: params.linkdescription,createdBy: user ,topic :topic)
        lr.save(flush:true , failOnError:true)
        flash.message = "Link has been added successfully"
        redirect(controller:"showTopic",action: 'showtopic')
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
        redirect(controller:"showTopic",action: 'showtopic')
    }

}
