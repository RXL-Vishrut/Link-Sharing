<div class="row" id="topicInfo"
     style="background-color: #f1f1f1;margin-bottom: 10px;margin-left: -4px;margin-right: -4px">
    <div class="col-lg-3">
        <a href="${createLink(controller: "profile", action: "userProfile")}">
            <img style="width: 100px;height: 100px;border-radius: 8px"
                 src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/></a>
    </div>

    <div class="col-lg-9" style="font-size: 15px">
        <div class="row Item-1">
            <div class="col-lg-12">
                <div class="hidden-field" hidden>
                    <g:textField name="topic" class="subscriptionName"
                                 placeholder="${topic.name}"
                                 style="width: 180px" id="topic${topic.id}"></g:textField>
                    <div hidden>${topic.id}</div>
                    <button type="submit" name="save"
                            class="subscriptionSave">Save</button>
                    <button type="submit" name="cancel"
                            class="subscriptionCancel ">Cancel</button>
                </div>

                <div class="topic">
                    <g:link controller="topic"
                            action="show"
                            params="[topicId: topic.id]"><b><u>${topic.name}</u>
                    </b></g:link>
                </div>
            </div>
        </div>

        <div class="row Item-2">
            <div class="col-lg-5"><b
                    style="color: dimgrey">@${topic.createdBy.userName}</b>
            </div>

            <div class="col" style="display: contents"><b>Subscriptions</b>
            </div>

            <div class="col"><b>Posts</b></div>

            <div class="w-100"></div>

            <div class="col-lg-5">
                <ls:showSubscribe
                        topicId="${topic.id}"
                        userId="${session.userId}"></ls:showSubscribe>
            </b>
            </div>

            <div class="col-lg-4"
                 style="text-align: center"><ls:subscriptionCount
                    topicId="${topic.id}"></ls:subscriptionCount>
            </div>

            <div class="col-lg-3"><ls:postCount
                    topicId="${topic.id}"></ls:postCount></div>
        </div>

        <div class="row Item-3" style="margin-top: 4px">
            <div class="col visible" hidden>
                <g:select name="visibility"
                          from="${enums.Visibility.values()}"></g:select>
            </div>

            <div class="col seriousness" hidden>
                <g:select name="seriousness"
                          from="${enums.Seriousness.values()}"></g:select>
            </div>
            <g:if test="${topic.createdBy.id == session.userId || session.userIsAdmin}">

                <div class="col">

                    <a href="#my_modal" data-toggle="modal"
                       data-topic-id="http://localhost:9090/topic/show?topicId=${topic.id}"><i
                            class="fa fa-envelope"
                            style="font-size: 17px;color: black;position:relative;right: 8px;top: 2px"></i>
                    </a>
                    <g:render template="/topic/invite"></g:render>

                    <i style="cursor: pointer;color: black ;font-size: 17px;position:relative;;top: 2px"
                       class="fa fa-pencil-square-o fa-lg topicEdit" topicId="${topic.id}"></i>
                    <i class="fa fa-trash fa-lg delete" id="delete" trashId="${topic.id}" aria-hidden="true"
                       style="color:black; position: relative;left: 8px;top:1px;font-size: 17px;cursor: pointer"
                       ;></i>
                </div>
            </g:if>
            <g:if test="${topic.createdBy.id != session.userId || session.userIsAdmin}">
                <g:select name="seriousness"
                          from="${enums.Seriousness.values()}"></g:select>
                <a href="#my_modal" data-toggle="modal"
                   data-topic-id="http://localhost:9090/topic/show?topicId=${topic.id}"><i
                        class="fa fa-envelope"
                        style="font-size: 17px;color: black;position:relative;left: 10px;top: 2px"></i>
                </a>
                <g:render template="/topic/invite"></g:render>
            </g:if>
        </div>
    </div>
</div>

