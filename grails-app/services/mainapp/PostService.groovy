package mainapp

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class PostService {

    LinkResource shareLink(Long userId, Long linkTopic, String link, String linkdescription) {
        User user = User.findById(userId)
        Topic topic = Topic.findById(linkTopic)
        LinkResource linkResource = new LinkResource(url: link, description: linkdescription, createdBy: user, topic: topic)
        return linkResource.save(flush: true)
    }
    List<ResourceRating> fetchTopPosts(){
        List topPosts = ResourceRating.createCriteria().list(max: 5) {
            order "score", "desc"
        } ?: []
        return topPosts
    }
    def delete(params,flash){
        Resource resource = Resource.findById(params.resourceId)
        if(resource){
            resource.delete(flush: true)
            flash.message = "You have deleted the resource"
            return
        }else{
           flash.message = "Unable to delete the resource"
            return
        }
    }

    boolean editPost(params){
        Resource resource = Resource.findById(params.resourceId)
        if(resource){
            resource.description = params.description
            return resource.save(flush:true)
        }else
            return false
    }
     boolean rating(params,session){
         Resource resource = Resource.get(params.resourceId)
         User user = User.get(session.userId)
         ResourceRating resourceRating = ResourceRating.findByUserAndResource(user, resource)
         if (resourceRating) {
             resourceRating.score = Integer.parseInt(params.value)
             return resourceRating.save(flush: true, failOnError: true)
         } else {
             ResourceRating rating = new ResourceRating(score: params.value, user: user, resource: params.resourceId)
             return rating.save(flush: true, failOnError: true)
         }
     }
}
