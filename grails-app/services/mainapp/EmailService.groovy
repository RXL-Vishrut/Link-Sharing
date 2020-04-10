package mainapp

import grails.gorm.transactions.Transactional
import grails.gsp.PageRenderer

@Transactional
class EmailService {
    PageRenderer groovyPageRenderer
    boolean email(params,session) {
        def content = groovyPageRenderer.render(view: '/emailSender/_template', model: [link:params.body,firstName:session.userFirstName,lastName:session.userLastName])
        sendMail {
            to params.address
            subject params.subject
            html (content)
        }
    }
}
