<g:each in="${trendingTopics}" var="${trendingTopic}">
    <ul class="list-group list-group-flush">
        <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
            <div class="row">
                <div class="col-lg-3">
                    <img height="90" width="90" style="border-radius: 8px"
                         src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': trendingTopic[1].createdBy.id])}"/>
                </div>

                <div class="col-lg-9" style="font-size: 15px">
                    <div class="row Item-1">
                        <div class="col-lg-12">
                            <div class="hidden-field" hidden>
                                <g:textField name="topic" class="subscriptionName"
                                             placeholder="${trendingTopic[1].name}"
                                             style="width: 180px" id="topic${trendingTopic[1].id}"></g:textField>
                                <div hidden>${trendingTopic[1].id}</div>
                                <button type="submit" name="save"
                                        class="subscriptionSave">Save</button>
                                <button type="submit" name="cancel"
                                        class="subscriptionCancel ">Cancel</button>
                            </div>

                            <div class="topic">
                                <g:link controller="topic"
                                        action="show"
                                        params="[topicId: trendingTopic[1].id]"><b><u>${trendingTopic[1].name}</u>
                                </b></g:link>
                            </div>
                        </div>
                    </div>

                    <div class="row Item-2">
                        <div class="col-lg-5"><b
                                style="color: dimgrey">@${trendingTopic[1].createdBy.userName}</b>
                        </div>

                        <div class="col" style="display: contents"><b>Subscriptions</b>
                        </div>

                        <div class="col"><b>Posts</b></div>

                        <div class="w-100"></div>

                        <div class="col-lg-5">
                            <ls:showSubscribe
                                    topicId="${trendingTopic[1].id}"
                                    userId="${session.userId}"></ls:showSubscribe>
                        </b>
                        </div>

                        <div class="col-lg-4"
                             style="text-align: center"><ls:subscriptionCount
                                topicId="${trendingTopic[1].id}"></ls:subscriptionCount>
                        </div>

                        <div class="col-lg-3"><ls:postCount
                                topicId="${trendingTopic[1].id}"></ls:postCount></div>
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
                        <g:if test="${trendingTopic[1].createdBy.id == session.userId}">

                            <div class="col">

                                <a href="#my_modal" data-toggle="modal"
                                   data-topic-id="http://localhost:9090/topic/show?&topicId=${trendingTopic[1].id}"><i
                                        class="fa fa-envelope"
                                        style="font-size: 20px;color: black;position:relative;right: 8px;top: 2px"></i>
                                </a>

                                <div class="modal" id="my_modal">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title"
                                                    id="exampleModalLongTitle2"><b>SEND INVITE</b>

                                                    <div class="alert-success">
                                                    </div>

                                                </h5>
                                                <button type="button" class="close"
                                                        data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="fieldcontain"
                                                     style="margin-bottom: 3px">
                                                    <g:textField name="address"
                                                                 placeholder="email@gmal.com"
                                                                 required="" id="address${topicId}"/>
                                                </div>

                                                <div>${topicId}</div>

                                                <div class="fieldcontain"
                                                     style="margin-bottom: 3px">
                                                    <g:textField name="subject"
                                                                 placeholder="Subject"
                                                                 required="" id="subject${topicId}"/>
                                                </div>

                                                <div class="fieldcontain"
                                                     style="margin-bottom: 3px">
                                                    <g:textArea name="bookId" rows="5"
                                                                cols="50"
                                                                required="" id="text${topicId}"/>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="submit"
                                                        class="btn btn-primary">Invite</button>
                                                <button type="button"
                                                        class="btn btn-secondary"
                                                        data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <i style="cursor: pointer;color: black ;font-size: 20px;position:relative;;top: 2px"
                                   class="fa fa-pencil-square-o fa-lg subscriptionEdit"></i>
                                <a href="#"><i class="fa fa-trash fa-lg" aria-hidden="true"
                                               style="color:black; position: relative;left: 8px;top:1px;font-size: 20px;"
                                               ;></i></a>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</g:each>
