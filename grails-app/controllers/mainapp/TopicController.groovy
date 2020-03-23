package mainapp

class TopicController {

    def index() { }

    def createTopic(){
        Topic topic = new Topic()
        bindData(topic,params)
        topic.save(flush: true, saveOnError: true)
        println(params)
        flash.message = "Topic created"
        redirect(controller: "Login", action: "dashboard")

    }
}
