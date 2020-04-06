<div class="row"
     style="background-color: #f1f1f1;margin-bottom: 10px;margin-right: 5px;margin-left: 5px">
    <div class="col-lg-3">
        <img height="110" width="90" style="border-radius: 13px;margin-top: 5px"
             src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': post.createdBy.id])}"/>
    </div>

    <div class="col-lg-9">
        <div class="row" style="padding-bottom: 5px;padding-top: 5px">
            <div class="col" style="padding: 0px">
                <b>${post.createdBy.firstName + " "}${post.createdBy.lastName + " "}</b>
            </div>

            <div class="col" style="padding: 0px">
                <b style="color: dimgrey; font-size: 15px">@${post.createdBy.userName}</b>
            </div>

            <div class="col-auto" style="font-size: 15px;padding:0px;color: dimgrey">
                <g:formatDate format=" hh:mm dd MMMM yyyy"
                              date="${post.topic.lastUpdated}"/>
            </div>
        </div>
        <div class="row">
            <g:link controller="topic" action="show" params="[userId: post.createdBy.id, topicId: post.topic.id]" ><b><u>${post.topic.name}</u></b></g:link>
        </div>

        <div class="row" style="padding-bottom: 5px;padding-top: 5px">

            ${post.description}

        </div>

        <div class="row" style="padding-bottom: 5px;padding-top: 5px">
            <div class="col-lg-3" style="padding: 0px">
                <a href="#"><i class="fa fa-facebook-f"
                               style="color: white;background-color:  #3b5998;margin-right: 5px;padding: 1px"></i>
                </a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                               style="margin-right: 5px"></i></a>
                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                               style="color: red"></i></a>
            </div>


            <div class="col-lg-9" style="font-size: 13px;padding: 0px">
                <g:if test="${post.class == mainapp.DocumentResource}">
                    <g:link controller="dashboard" action="download"
                            params="[postId: post.id]"><u
                            style="margin-right:22px;">Download</u></g:link>
                    <g:link action="#" controller="#"><u
                            style="margin-right:22px;">Mark as read</u></g:link>
                    <g:link controller="post" action="show"
                            params="[userId: post.createdBy.id, topicId: post.topic.id,resourceId:post.id]"><u>View Post</u></g:link>
                </g:if>
                <g:if test="${post.class == mainapp.LinkResource}">
                    <a style="margin-right: 22px" href="${post.url}"
                       target="_blank"><u>View full site</u></a>
                    <g:link action="#" controller="#"><u
                            style="margin-right:22px;">Mark as read</u></g:link>
                    <g:link controller="post" action="show"
                            params="[userId: post.createdBy.id, topicId: post.topic.id,resourceId:post.id]"><u>View Post</u></g:link>
                </g:if>
            </div>
        </div>
    </div>
</div>