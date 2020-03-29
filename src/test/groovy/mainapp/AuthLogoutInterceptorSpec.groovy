package mainapp

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class AuthLogoutInterceptorSpec extends Specification implements InterceptorUnitTest<AuthLogoutInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test authLogout interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"authLogout")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
