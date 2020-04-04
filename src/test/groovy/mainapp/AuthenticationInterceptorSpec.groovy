package mainapp

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class AuthenticationInterceptorSpec extends Specification implements InterceptorUnitTest<AuthenticationInterceptor> {

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
