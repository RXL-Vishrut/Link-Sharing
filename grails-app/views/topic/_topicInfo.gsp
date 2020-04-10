<div class="row" id="topicInfo"
     style="background-color: #f1f1f1;margin-bottom: 10px;margin-left: -4px;margin-right: -4px">
    <div class="col-lg-3">
        <img height="90" width="90" style="border-radius: 8px"
             src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': topic.createdBy.id])}"/>
    </div>

    <div class="col-lg-9" style="font-size: 15px">
        <div class="row Item-1" style="height: 25px">
            <div class="col-lg-12">
                <div class="hidden-field" hidden>
                    <g:textField name="topic" class="subscriptionName"
                                 placeholder="${topic.name}"
                                 style="width: 180px"
                                 id="topic${topic.id}"></g:textField>
                    <div hidden>${topic.id}</div>
                    <button type="submit" name="save"
                            class="subscriptionSave">Save</button>
                    <button type="submit" name="cancel"
                            class="subscriptionCancel ">Cancel</button>
                </div>

                <div class="row topic" style="height:30px">
                    <div class="col">
                        <g:if test="${topic.visibility == enums.Visibility.Public}">
                            <g:link controller="topic"
                                    action="show"
                                    params="[topicId: topic.id]"><b><u>${topic.name + " "}</u>
                            </b></g:link>
                        </g:if>
                        <g:else>
                            <g:if test="${topic.createdBy.id == session.userId}">
                                <g:link controller="topic"
                                        action="show"
                                        params="[topicId: topic.id]"><b><u>${topic.name}</u>
                                </b></g:link>
                                <pre style="color: dimgrey;display: contents"><b>(PRIVATE)</b>
                                </pre>
                            </g:if>
                            <g:else>
                                <g:link controller="dashboard"
                                        action="show"><b><u>${topic.name}</u>
                                </b></g:link>
                                <pre style="color: dimgrey;display: contents"><b>(PRIVATE)</b>
                                </pre>
                            </g:else>
                        </g:else>
                    </div>
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

        <div class="row Item-3" %{--style="text-align: right --}%   ">
            <div class="col visible" hidden>
                <g:select name="visibility" id="visibility"
                          visibilityId="${topic.id}"
                          from="${enums.Visibility.values()}"></g:select>
            </div>

            <div class="col seriousness" hidden>
                <g:select name="seriousness" id="seriousness"
                          seriousnessId="${topic.id}"
                          from="${enums.Seriousness.values()}"></g:select>
            </div>
            <g:if test="${topic.createdBy.id == session.userId || session.userIsAdmin}">

                <div class="col" style="text-align: right">

                    <a href="#my_modal" data-toggle="modal"
                       data-topic-id="http://localhost:9090/topic/show?topicId=${topic.id}"><i
                            class="fa fa-envelope"
                            style="font-size: 17px;color: black;position:relative;right: 8px;top: 2px"></i>
                    </a>
                    <g:render template="/topic/invite"></g:render>
                    <i style="cursor: pointer;color: black ;font-size: 17px;position:relative;;top: 2px"
                       class="fa fa-pencil-square-o fa-lg topicEdit"
                       topicId="${topic.id}"></i>
                    <i class="fa fa-trash fa-lg delete" id="delete"
                       trashId="${topic.id}" aria-hidden="true"
                       style="color:black; position: relative;left: 8px;top:1px;font-size: 17px;cursor: pointer"
                       ;></i>
                </div>
            </g:if>
            <g:if test="${(topic.createdBy.id != session.userId/* && topic.visibility == enums.Visibility.Public*/ && !session.userIsAdmin && mainapp.Subscription.findByTopicAndUser(topic,mainapp.User.get(session.userId)))}">
                <div class="col-lg-5"></div>
                <div class="col-lg-4">
                    <g:select name="subSeriousness" class="subSeriousness" topicId="${topic.id}"
                              from="${enums.Seriousness.values()}" value="${mainapp.Subscription?.findByUserAndTopic(mainapp.User.get(session.userId),topic)?.seriousness}"></g:select>
                </div>

                <div class="col-lg-3 " style="text-align: center">
                    <a href="#my_modal" data-toggle="modal"
                       data-topic-id="http://localhost:9090/topic/show?topicId=${topic.id}"><i
                            class="fa fa-envelope"
                            style="font-size: 17px;color: black;top: 2px"></i>
                    </a>
                    <g:render template="/topic/invite"></g:render>
                </div>
            </g:if>
        <g:if test="${(topic.createdBy.id != session.userId /*&& topic.visibility == enums.Visibility.Public*/ && !session.userIsAdmin && !mainapp.Subscription.findByTopicAndUser(topic,mainapp.User.get(session.userId)))}">
            <div class="col-lg-10"></div>
            <div>
                <a href="#my_modal" data-toggle="modal"
                   data-topic-id="http://localhost:9090/topic/show?topicId=${topic.id}"><i
                        class="fa fa-envelope"
                        style="font-size: 17px;color: black;top: 2px"></i>
                </a>
                <g:render template="/topic/invite"></g:render>
            </div>
        </g:if>
        </div>
    </div>
</div>