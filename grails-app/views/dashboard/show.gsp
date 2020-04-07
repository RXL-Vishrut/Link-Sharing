<%@ page import="mainapp.Topic; java.beans.Visibility" %>
<!DOCTYPE html>
<html lang="en" xmlns:hidden="http://www.w3.org/1999/xhtml">
<head>
    <meta name="layout" content="main"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    %{--    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--}%
    %{--            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--}%
    %{--            crossorigin="anonymous"></script>--}%
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/a81c0d9f01.js"></script>
    <asset:stylesheet src="dashboard.css"/>
    <asset:javascript src="dashboard.js"/>
</head>

<body>

<g:if test="${flash.message}">
    <div id="fm" class="alert alert-success"
         style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
</g:if>
<div id="trash" style="text-align: center;background-color: #b2d1ff;color: black"></div>

<div id="trashdanger" style="text-align: center; background-color: red;color: white"></div>

<div id="private" style="text-align: center;background-color: #b2d1ff;color: black"></div>

%{--<----------------------------------------Photo Section------------------------------------->--}%

<div class="container" style="background-color: #f1f1f1">
    <div class="row">

        <div class="col-lg-5">
            <div class="card-header"
                 style="background-color: #343a40;color: white;position:relative;top: 3px;width: 32rem"><b>User</b>
            </div>
            <g:render template="/userProfile/profileInfo"></g:render>


            %{--            <-----------------------------subscriptions---------------------------------->--}%
            <div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <span><b>Subscriptions</b></span>
                    <span style="float:right"><b><a href="#"><u style="color: white">View All</u></a></b></span>
                </div>

                <div class="card-body text-dark overflow-auto"
                     style="padding: 15px;max-height: 319px;height:auto;overflow: scroll">
                    <g:if test="${userSubscriptions}">
                        <g:each in="${userSubscriptions.take(5)}" var="userSubscription">
                            <g:render template="/topic/topicInfo" model="[topic: userSubscription.topic]"></g:render>
                        </g:each>
                    </g:if>
                    <g:else><div class="alert-danger" style="text-align: center">NO SUBSCRIPTIONS YET</div></g:else>
                </div>
            </div>


            %{--            <------------------------------TRENDING TOPICS----------------------------->--}%
            <div class="card border-dark mb-6" style="width: 32rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <b>Trending Topics</b>
                </div>

                <div class="card-body text-dark" style="height: 284px;overflow: scroll;max-height: 320px;height: auto">

                    <g:if test="${trendingTopics}">
                        <g:each in="${trendingTopics}" var="trendingTopic">
                        %{--                            <g:render template="/topic/topicInfo" model="[topic: trendingTopic[1]]"></g:render>--}%
                            <div class="row" id="topicInfo"
                                 style="background-color: #f1f1f1;margin-bottom: 10px;margin-left: -4px;margin-right: -4px">
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
                                                             style="width: 180px"
                                                             id="topic${trendingTopic[1].id}"></g:textField>
                                                <div hidden>${trendingTopic[1].id}</div>
                                                <button type="submit" name="save"
                                                        class="subscriptionSave">Save</button>
                                                <button type="submit" name="cancel"
                                                        class="subscriptionCancel ">Cancel</button>
                                            </div>

                                            <div class="row topic" style="height:30px">
                                                <div class="col">
                                                    <g:if test="${trendingTopic[1].visibility == enums.Visibility.Public}">
                                                        <g:link controller="topic"
                                                                action="show"
                                                                params="[topicId: trendingTopic[1].id]"><b><u>${trendingTopic[1].name + " "}</u>
                                                        </b></g:link>
                                                    </g:if>
                                                    <g:else>
                                                        <g:if test="${trendingTopic[1].createdBy.id == session.userId}">
                                                            <g:link controller="topic"
                                                                    action="show" params="[topicId: trendingTopic[1].id]"><b><u>${trendingTopic[1].name}</u>
                                                            </b></g:link>
                                                            <pre style="color: dimgrey;display: contents"><b>(PRIVATE)</b>
                                                            </pre>
                                                        </g:if>
                                                        <g:else>
                                                            <g:link controller="dashboard"
                                                                    action="show"><b><u>${trendingTopic[1].name}</u>
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
                                        <g:if test="${trendingTopic[1].createdBy.id == session.userId || session.userIsAdmin}">

                                            <div class="col">

                                                <a href="#my_modal" data-toggle="modal"
                                                   data-topic-id="http://localhost:9090/topic/show?topicId=${trendingTopic[1].id}"><i
                                                        class="fa fa-envelope"
                                                        style="font-size: 17px;color: black;position:relative;right: 8px;top: 2px"></i>
                                                </a>

                                                <div class="modal" id="my_modal">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title"
                                                                    id="exampleModalLongTitle2"><b>SEND INVITE</b>

                                                                    <div class="alert-success">
                                                                    </div>

                                                                    <div class="alert-danger"></div>

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
                                                                                 placeholder="email"
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
                                                                    <g:textArea name="topicId" rows="5"
                                                                                cols="50"
                                                                                required="" id="text${topicId}"/>
                                                                </div>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="submit"
                                                                        class="btn btn-primary" name="invite"
                                                                        id="invite">Invite</button>
                                                                <button type="button"
                                                                        class="btn btn-secondary"
                                                                        data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <i style="cursor: pointer;color: black ;font-size: 17px;position:relative;;top: 2px"
                                                   class="fa fa-pencil-square-o fa-lg topicEdit"
                                                   topicId="${trendingTopic[1].id}"></i>
                                                <i class="fa fa-trash fa-lg delete" id="delete"
                                                   trashId="${trendingTopic[1].id}" aria-hidden="true"
                                                   style="color:black; position: relative;left: 8px;top:1px;font-size: 17px;cursor: pointer"
                                                   ;></i>
                                                %{--                    <div id="trash" style="text-align: center;background-color: #b2d1ff;color: black"></div>--}%
                                                %{--                    <div id="trashdanger" style="text-align: center; background-color: red;color: white"></div>--}%
                                            </div>
                                        </g:if>
                                    </div>
                                </div>
                            </div>

                        </g:each>
                    </g:if>
                    <g:else>
                        <div class="alert-danger" style="text-align: center">
                            NO TOPICS CREATED
                        </div>
                    </g:else>
                </div>
            </div>
        </div>

        <div class=col-lg-1>

        </div>

        %{--        <---------------------------------------INBOX------------------------------------->--}%
        <div class="col-lg-6">
            <div class="card border-dark mb-6" style="width: 34rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <div class="row">
                        <div class="col" style="margin-top: 7px">
                            <b style="padding: 2px">Inbox</b>
                        </div>
                    </div>

                </div>

                <div class="card-body text-dark" style="padding: 5px;margin-top: 5px">
                    <g:if test="${resources}">
                        <g:each in="${resources}" var="${resource}">
                            <g:if test="${resource.description != null}">
                                <div class="row"
                                     style="background-color: #f1f1f1;margin-bottom: 10px;margin-right: 5px;margin-left: 5px">
                                    <div class="col-lg-3" style="margin-top: 10px">
                                        <img height="110" width="90" style="border-radius: 15px"
                                             src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': resource.createdBy.id])}"/>
                                    </div>

                                    <div class="col-lg-9">
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
                                            <div class="col-lg-3" style="padding: 0px">
                                                <a href="#"><i class="fa fa-facebook-f"
                                                               style="color: white;background-color:  #3b5998;margin-right: 5px;padding: 1px"></i>
                                                </a>
                                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                                               style="margin-right: 5px"></i></a>
                                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                                               style="color: red"></i></a>
                                            </div>


                                            <div class="col-lg-9"
                                                 style="font-size: 13px;padding: 0px;text-align: right">
                                                <g:if test="${resource.class == mainapp.DocumentResource}">
                                                    <g:link controller="dashboard" action="download"
                                                            params="[postId: resource.id]"><u
                                                            style="margin-right:22px;">Download</u></g:link>

                                                    <div class="resource" hidden>
                                                        ${resource.id}
                                                    </div>
                                                    <g:link controller="#" action="#"
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
                                                    <g:link controller="#" action="#"
                                                            params="[resourceId: resource.id]"><u>Mark as read</u></g:link>
                                                    <g:link controller="post" action="show"
                                                            params="[resourceId: resource.id]"><u>View Post</u></g:link>
                                                </g:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:if>
                        </g:each>
                    </g:if>
                    <g:else>
                        <div class="alert-danger" style="text-align: center;">
                            NO INBOX MESSAGES YET
                        </div>
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>