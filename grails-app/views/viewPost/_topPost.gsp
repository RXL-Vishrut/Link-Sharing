<div class="row"
     style="background-color: #f1f1f1;margin-left: -1px;margin-right: -1px;margin-bottom: 20px">
    <div class="row">
        <div class="col-lg-3">
            <img height="110" width="110"
                 style="padding-top: 7px;padding-left: 10px;border-radius: 20px"
                 src="${createLink(controller: 'login', action: 'viewImage', params: ['userId': resource.createdBy.id])}"/>
        </div>

        <div class="col-lg-9">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row" style="padding: 4px">
                        <div class="col-lg-9" style="color: black">
                            <b>${resource.createdBy.firstName + " "}${resource.createdBy.lastName + "  "}</b>
                            <span style="font-size: 15px;position: relative;left: 120px">
                                <b>Topic :</b> <a
                                    href="${createLink(controller: "login", action: "error")}"><b><u>${resource.topic.name}</u>
                                </b></a>
                            </span>
                        </div>

                        <div class="col-lg-8"  style="font-size: 13px;font-weight: bold;color: dimgrey;"><g:formatDate
                                format=" hh:mm dd MMMM yyyy"
                                date="${resource.lastUpdated}"/>
                        </div>
                    </div>
                </div>

                <div class="w-100"></div>

                <div class="col-lg-12" style="margin-left: 19px;word-break: break-all;">
                    <div class="row">
                        <p>${resource.description}</p>
                    </div>
                </div>

                <div class="w-100"></div>

                <div class="col-lg-12">
                    <span style="margin-top: 4px;font-size: 17px">
                        <a href="#"><i class="fa fa-facebook-f"
                                       style="color: white;background-color:  #3b5998;margin-right: 10px;padding: 1px"></i>
                        </a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                       style="margin-right: 10px"></i>
                        </a>
                        <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                       style="color: red"></i></a>
                    </span>
                    <span style="font-size: 12px;position:relative;left: 110px">
                        <g:if test="${resource.class == mainapp.LinkResource}"><g:link
                                controller="login" action="error"><b><u>View Full Site</u>
                            </b></g:link>
                        </g:if>
                        <g:else><u><g:link controller="login"
                                           action="error"><b>Download</b></g:link></u>
                        </g:else>
                    </span>
                    <span style="position:relative;left: 120px">
                        <a href="${createLink(controller: "login", action: "error")}"
                           style="font-size:12px"><u><b>View Post</b></u></a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>