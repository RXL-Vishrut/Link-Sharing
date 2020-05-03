<g:if test="${resource.description != null}">
    <div class="row"
         style="background-color: #f1f1f1;margin-bottom: 10px;margin-right: 5px;margin-left: 5px">
        <div class="col-sm-3" style="margin-top: 10px">
            <img height="110" width="90" style="border-radius: 15px"
                 src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': resource.createdBy.id])}"/>
        </div>

        <div class="col-sm-9">
            <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                <div class="col" style="padding: 0px;position:relative;top: 3px">
                    <b>${resource.createdBy.firstName + " "}${resource.createdBy.lastName + " "}</b>
                </div>

                <div class="col" style="padding: 0px;top: 2px">
                    <b style="color: dimgrey; font-size: 15px">@${resource.createdBy.userName}</b>
                </div>

                <div class="col-auto"
                     style="font-size: 15px;padding:0px;color: dimgrey;top: 4px">
                    <b><g:formatDate format=" hh:mm dd MMMM yyyy"
                                     date="${resource.lastUpdated}"/></b>
                </div>
            </div>

            <div class="row" style="font-size: 15px">
                <b>Topic :</b><g:link controller="topic" action="show"
                                      params="[topicId: resource.topic.id]"><b><u>${resource.topic.name}</u>
                </b></g:link>
            </div>

            <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                ${resource.description}
            </div>

            <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                <div class="col-sm-3" style="padding: 0px">
                    <a href="#"><i class="fa fa-facebook-f"
                                   style="color: white;background-color:  #3b5998;margin-right: 5px;padding: 1px"></i>
                    </a>
                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                   style="margin-right: 5px"></i></a>
                    <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                   style="color: red"></i></a>
                </div>


                <div class="col-sm-9"
                     style="font-size: 13px;padding: 0px;text-align: right">
                    <g:if test="${resource.class == mainapp.DocumentResource}">
                        <g:link controller="dashboard" action="download"
                                params="[postId: resource.id]"><u
                                style="margin-right:22px;">Download</u></g:link>

                        <div class="resource" hidden>
                            ${resource.id}
                        </div>
                        <g:link controller="dashboard" action="isRead" resourceId="${resource.id}"
                                params="[resourceId: resource.id]"><u>Mark as read</u></g:link>
                        <g:link controller="post" action="show" style="margin-left: 20px"
                                params="[resourceId: resource.id]"><u>View Post</u></g:link>
                    </g:if>

                    <g:if test="${resource.class == mainapp.LinkResource}">
                        <a style="margin-right: 15px" href="${resource.url}"
                           target="_blank"><u>View full site</u></a>

                        <div class="resource" hidden>
                            ${resource.id}
                        </div>
                        <g:link class="readPost" resourceId="${resource.id}"
                                params="[resourceId: resource.id]"><u>Mark as read</u></g:link>
                        <g:link controller="post" action="show" style="margin-left: 20px"
                                params="[resourceId: resource.id]"><u>View Post</u></g:link>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</g:if>