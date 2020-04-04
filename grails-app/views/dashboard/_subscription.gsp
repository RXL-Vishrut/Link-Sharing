<div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px">
    <div class="card-header" style="background-color: #343a40;color: white">
        <span><b>Subscriptions</b></span>
        <span style="float:right"><b><a href="#"><u style="color: white">View All</u></a></b></span>
    </div>

    <div class="card-body text-dark overflow-auto" style="padding: 15px;height: 319px;overflow: scroll">
        <g:if test="${userSubscriptions}">
            <g:each in="${userSubscriptions.take(5)}" var="${userSubscription}">

                <ul class="list-group list-group-flush">
                    <g:if test="${userSubscription.user.email == session.userEmail}">
                        <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
                            %{--                    <g:if test="${p.topic.createdBy}"--}%
                            <div class="row">
                                <div class="col-lg-3">
                                    <img height="90" width="90" style="border-radius: 15px"
                                         src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': userSubscription.user.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row Item-1">
                                        <div class="col-lg-12">
                                            <div class="hidden-field" hidden>
                                                <g:textField name="topic" class="subscriptionName"
                                                             placeholder="${userSubscription.topic.name}"
                                                             style="width: 180px"></g:textField>
                                                <div hidden>${userSubscription.topic.id}</div>
                                                <button type="submit" name="save"
                                                        class="subscriptionSave">Save</button>
                                                <button type="submit" name="cancel"
                                                        class="subscriptionCancel ">Cancel</button>
                                            </div>

                                            <div class="topic">
                                                <g:link controller="topic"
                                                        action="show"
                                                        params="[userId: userSubscription.user.id, topicId: userSubscription.topic.id]"><b><u>${userSubscription.topic.name}</u>
                                                </b></g:link>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row Item-2" style="font-size: 15px">
                                        <div class="col-lg-5"><b
                                                style="color: dimgrey">@${userSubscription.user.userName}</b>
                                        </div>

                                        <div class="col" style="display: contents;font-size: 15px"><b>Subscriptions</b>
                                        </div>

                                        <div class="col" style="font-size: 15px"><b>Posts</b></div>

                                        <div class="w-100"></div>

                                        <div class="col-lg-5"><g:link controller="dashboard" action="unsubscribe"
                                                                      params="[userId: userSubscription.user.id, topicId: userSubscription.topic.id]"><b><u>Unsubscribe</u>
                                            </b></g:link></div>

                                        <div class="col-lg-4" style="position:relative;left: 20px"><ls:subscriptionCount
                                                topicId="${userSubscription.topic.id}"></ls:subscriptionCount></div>

                                        <div class="col-lg-3"><ls:postCount
                                                topicId="${userSubscription.topic.id}"></ls:postCount></div>
                                    </div>

                                    <div class="row Item-3" style="margin-top: 4px">
                                        <div class="col visible" hidden>
                                            <g:select name="visibility" id="visibility"
                                                      from="${enums.Visibility.values()}"></g:select>
                                        </div>

                                        <div class="col seriousness" hidden>
                                            <g:select name="seriousness" id="seriousness"
                                                      from="${enums.Seriousness.values()}"></g:select>
                                        </div>
                                        <g:if test="${userSubscription.topic.createdBy.id == session.userId}">
                                            <div class="col">
                                                <button class="btn" data-toggle="modal" data-target="#invite" style="line-height: 1"><i
                                                        class="fa fa-envelope"
                                                        style="font-size: 20px"></i>
                                                </button>
                                                <g:form url='[controller: "dashboard", action: "invite", params: [topicId: userSubscription.topic.id, userId: userSubscription.user.id]]' style="display: contents">
                                                    <div class="modal fade" id="invite" tabindex="-1" role="dialog"
                                                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLongTitle2"><b>SEND INVITE</b></h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="fieldcontain" style="margin-bottom: 3px">
                                                                        <g:textField name="address" placeholder="email@gmal.com" required=""/>
                                                                    </div>
                                                                    <div class="fieldcontain" style="margin-bottom: 3px">
                                                                        <g:textField name="subject" placeholder="Subject" required=""/>
                                                                    </div>
                                                                    <div class="fieldcontain" style="margin-bottom: 3px">
                                                                        <g:textArea name="body" rows="5" cols="50" placeholder="Your message" required=""/>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="submit" class="btn btn-primary">Invite</button>
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </g:form>
                                                <i style="cursor: pointer;color: black ;font-size: 20px;position:relative;;top: 2px"  class="fa fa-pencil-square-o fa-lg subscriptionEdit"
                                                ></i>
                                                <a href="#"><i class="fa fa-trash fa-lg" aria-hidden="true"
                                                               style="color:black; position: relative;left: 8px;top:1px;font-size: 20px;"                                                           ;></i></a>
                                            </div>
                                        </g:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </g:if>




                    <g:else>
                        <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img height="90" width="90"
                                         src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': userSubscription.user.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <g:link controller="topic"
                                                    action="show"
                                                    params="[topicId: userSubscription.topic.id]"><b><u>${userSubscription.topic.name}</u>
                                            </b></g:link>
                                        </div>
                                    </div>

                                    <div class="row" style="font-size: 15px">
                                        <div class="col-lg-5"><b
                                                style="color: dimgrey">@${userSubscription.user.userName}</b>
                                        </div>

                                        <div class="col"><b>Subscriptions</b></div>

                                        <div class="col"><b>Posts</b></div>

                                        <div class="w-100"></div>

                                        <div class="col-lg-5"><g:link controller="dashboard" action="unsubscribe"
                                                                      params="[userId: userSubscription.user.id, topicId: userSubscription.topic.id]"><b><u>Unsubscribe</u>
                                            </b></g:link></div>

                                        <div class="col-lg-4" style="text-align: center">50</div>

                                        <div class="col-lg-3" style="text-align: center">40</div>
                                    </div>

                                    <div class="row" style="margin-top: 4px">
                                        <div class="col-lg-5">

                                        </div>

                                        <div class="col-lg-4">
                                            <g:select class="subvisib" name="seriousness"
                                                      from="${enums.Seriousness.values()}"></g:select>
                                        </div>

                                        <div class="col-g-1">
                                            <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                                           style="color:black;position: relative; left: 50px;font-size: 15px;bottom: 3px"
                                                           ;></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </g:else>
                </ul>
            </g:each>
        </g:if>
        <g:else><div class="alert-danger">No subscriptions yet..create topics first</div></g:else>
    </div>
</div>