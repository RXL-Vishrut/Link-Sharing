package mainapp


import enums.Seriousness
import enums.Visibility
import grails.converters.JSON
import grails.gsp.PageRenderer

class DashboardController {

    static defaultAction = "show"
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    DashboardService dashboardService
    TopicService topicService

    def show() {
        List<ReadingItem> readingItems = topicService.fetchSubscribedTopics(session.userId)
        List<Subscription> userSubscriptions = topicService.fetchUserSubscriptions(session.userId)
        List<Resource> trendingTopics = topicService.fetchTrendingTopics()
        render(view: "/dashboard/show", model: [readingItems: readingItems, userSubscriptions: userSubscriptions, trendingTopics: trendingTopics])
    }

    def viewImage() {
        byte[] imageInByte = dashboardService.viewImage(Long.valueOf(params.userId))
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }

        def download() {
            DocumentResource documentResource = DocumentResource.get(params.postId)
            File file = new File(documentResource.filePath)
            byte[] orderPDF = file.bytes
            response.setHeader("Content-disposition", "attachment; filename=" + file.name)
            response.contentType = "application/octet-stream"
            response.contentLength = orderPDF.length
            response.outputStream << orderPDF
            response.outputStream.flush()
            response.outputStream.close()
        }
    }