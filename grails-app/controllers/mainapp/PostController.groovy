package mainapp

import grails.converters.JSON

class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    DashboardService dashboardService
    PostService postService

    def show() {
        User user = User.findById(session.userId)
        Resource resource = Resource.findById(params.resourceId)
        Topic topic = resource.topic
        List trendingTopics = Resource.createCriteria().list(max: 5) {
            projections {
                count("id", "count")
            }
            groupProperty("topic")
            order("count", "desc")
        }
        List<Subscription> userSubscriptions = Subscription.createCriteria().list() {
            and {
                inList("user", user)
                order("dateCreated", "desc")
            }
        }
        render(view: "/viewPost/show", model: [user: user, topic: topic, resource: resource, trendingTopics: trendingTopics, userSubscriptions: userSubscriptions])
    }

    def viewImage() {
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }

    def rating() {
        Resource resource = Resource.get(params.resourceId)
        User user = User.get(session.getAttribute("userId"))
        ResourceRating res = ResourceRating.findByUserAndResource(user, resource)
        if (res) {
            res.score = Integer.parseInt(params.value)
            res.save(flush: true, failOnError: true)
            render([success: false] as JSON)
        } else {
            ResourceRating rating = new ResourceRating(score: params.value, user: user, resource: params.resourceId)
            rating.save(flush: true, failOnError: true)
            render([success: true] as JSON)
        }

    }

    def shareLink() {
        LinkResource linkResource = postService.shareLink(session.userId, Long.valueOf(params.linkTopic), params.link, params.linkdescription)
        if (linkResource) {
            flash.message = "Link has been added successfully"
            redirect(controller: "dashboard", action: 'show')
        }

    }


    def shareDoc() {
        User user = User.findById(session.userId)
        Topic topic = Topic.findById(params.linkTopic)
        if (topic) {
            def file1 = request.getFile("document")
            String dir1 = new Date()
            String dir2 = dir1.split(" ").join("")
            String dir = "/home/vishrut/LinkSharing/MainApp/DocumentResource/${dir2}.pdf"
            file1.transferTo(new File(dir))
            DocumentResource dr = new DocumentResource(filePath: dir, description: params.docdescription, createdBy: user, topic: topic)
            dr.save(flush: true, failOnError: true)
            flash.message = "Document has been added successfully"
            redirect(controller: "dashboard", action: 'show')
        } else {
            flash.message = "Document cannot be added"
            redirect(controller: "dashboard", action: 'show')
        }

    }
}
