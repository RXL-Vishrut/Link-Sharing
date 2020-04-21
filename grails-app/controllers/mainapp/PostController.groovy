package mainapp

import grails.converters.JSON

class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    DashboardService dashboardService
    PostService postService
    TopicService topicService

    def show() {
        User user = User.findById(session.userId)
        Resource resource = Resource.findById(params.resourceId)
        Integer resourceRating = ResourceRating.findByResourceAndUser(resource, user)?.score
        if(resourceRating == null){
            resourceRating = 0
        }
        println(resourceRating)
        List trendingTopics = topicService.fetchTrendingTopics()
        render(view: "/viewPost/show", model: [resource: resource, trendingTopics: trendingTopics,resourceRating:resourceRating])
    }
    def deletePost(){
        postService.delete(params,flash)
        redirect(controller: "dashboard", action: "show")
    }
    def editPost(){
        boolean edit = postService.editPost(params)
        render([success: edit?:false] as JSON)
    }
    def rating() {
        boolean rating = postService.rating(params,session)
        render([success: rating?:false] as JSON)
    }
    def viewImage() {
        byte[] imageInByte = dashboardService.viewImage(Long.valueOf(params.userId))
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
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
            DocumentResource documentResource = new DocumentResource(filePath: dir, description: params.docdescription, createdBy: user, topic: topic)
            documentResource.save(flush: true, failOnError: true)
            flash.message = "Document has been added successfully"
            redirect(controller: "dashboard", action: 'show')
        } else {
            flash.message = "Document cannot be added"
            redirect(controller: "dashboard", action: 'show')
        }
    }

}
