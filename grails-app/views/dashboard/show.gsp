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


%{--<----------------------------------------Photo Section------------------------------------->--}%

<div class="container" style="background-color: #f1f1f1">
    <div class="row">

        <div class="col-lg-5">

            <div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white"><b>User</b></div>

                <div class="card-body text-dark " style="padding: 12px;margin-right: 15px">
                    <div class="row" style="background-color: #f1f1f1;margin-left: 1px">
                        <div class="col-lg-4">
                            <a href="${createLink(controller: "profile", action: "show")}">
                                <img style="width: 100px;height: 110px;border-radius: 8px"
                                     src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/></a>
                        </div>

                        <div class="col-lg-8">
                            <div>
                                <p style="font-size: 25px; margin-bottom: 1px;padding: 5px"><b>${session.getAttribute("userFirstName")}  ${session.getAttribute("userLastName")}</b>
                                    <b style="font-size: 15px;color: dimgrey;position: relative;bottom: 5px">~@${session.getAttribute("userUserName")}</b>
                                </p>
                            </div>

                            <div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <b style="color: dimgrey">Subscriptions</b>
                                    </div>

                                    <div class="col-lg-6">
                                        <b style="color: dimgrey">Topics</b>
                                    </div>

                                    <div class="w-100">
                                    </div>

                                    <div class="col-lg-6" style="text-align: center;position:relative;right: 10px">
                                        <b><ls:subscriptionCount userId="${user.id}"></ls:subscriptionCount></b>
                                    </div>

                                    <div class="col-lg-6" style="text-align: center;position:relative;right: 40px">
                                        <b><ls:topicCount userId="${user.id}"></ls:topicCount></b>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <g:render template="subscription" model="[userSubscriptions: userSubscriptions]"></g:render>





            %{--            <------------------------------TRENDING TOPICS----------------------------->--}%
            <div class="card border-dark mb-6" style="width: 32rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <b>Trending Topics</b>
                </div>

                <div class="card-body text-dark" style="height: 284px;overflow: scroll">
                    <g:if test="${trendingTopics}">
                        <g:each in="${trendingTopics}" var="trendingTopic">
                            <ul class="list-group list-group-flush">
                                <g:if test="${trendingTopic[1].createdBy.email == session.userEmail}">
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
                                                                         style="width: 180px"></g:textField>
                                                            <div hidden>${trendingTopic[1].id}</div>
                                                            <button type="submit" name="save"
                                                                    class="subscriptionSave">Save</button>
                                                            <button type="submit" name="cancel"
                                                                    class="subscriptionCancel ">Cancel</button>
                                                        </div>

                                                        <div class="topic">
                                                            <g:link controller="topic"
                                                                    action="show"
                                                                    params="[userId: trendingTopic[1].createdBy.id, topicId: trendingTopic[1].id]"><b><u>${trendingTopic[1].name}</u>
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
                                                        <b><u><ls:showSubscribe
                                                                topicId="${trendingTopic[1].id}"></ls:showSubscribe></u></b>
                                                    </div>
                                                    <div class="col-lg-4"
                                                         style="text-align: center"><b><u><ls:subscriptionCount
                                                            topicId="${trendingTopic[1].id}"></ls:subscriptionCount></u>
                                                    </b></div>

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

                                                    <div class="col" style="left: 20px">
                                                        <a class="subscriptionInvite"><i class="fa fa-envelope fa-lg "
                                                                                         aria-hidden="true"
                                                                                         style="color:black;position: relative; right: 10px;font-size: 15px;bottom: 3px"
                                                                                         ;></i></a>
                                                        <a class="subscriptionEdit"><i
                                                                class="fa fa-pencil-square-o fa-lg "
                                                                aria-hidden="true"
                                                                style="color:black; position: relative;font-size: 15px;bottom: 2px"
                                                                ;></i></a>
                                                        <a href="#"><i class="fa fa-trash fa-lg" aria-hidden="true"
                                                                       style="color:black; position: relative;left: 7px;font-size: 17px;bottom: 3px"
                                                                       ;></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </g:if>

                                <g:else>
                                    <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <img height="90" width="90" style="border-radius: 15px"
                                                     src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': trendingTopic[1].createdBy.id])}"/>
                                            </div>

                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <g:link controller="topic"
                                                                action="show"
                                                                params="[userId: trendingTopic[1].createdBy.id, topicId: trendingTopic[1].id]"><b><u>${trendingTopic[1].name}</u>
                                                        </b></g:link>
                                                    </div>
                                                </div>

                                                <div class="row" style="font-size: 15px">
                                                    <div class="col-lg-5"><b
                                                            style="color: dimgrey">@${trendingTopic[1].createdBy.userName}</b>
                                                    </div>

                                                    <div class="col" style="display: contents"><b>Subscriptions</b>
                                                    </div>

                                                    <div class="col"><b>Posts</b></div>

                                                    <div class="w-100"></div>

                                                    <div class="col-lg-5">
                                                        <u><b><ls:showSubscribe
                                                                topicId="${trendingTopic[1].id}"></ls:showSubscribe></b>
                                                        </u>
                                                    </div>

                                                    <div class="col-lg-4"
                                                         style="text-align: center"><u><b><ls:subscriptionCount
                                                            topicId="${trendingTopic[1].id}"
                                                            userId="${trendingTopic[1].createdBy.id}"></ls:subscriptionCount></b>
                                                    </u></div>

                                                    <div class="col-lg-3"><ls:postCount
                                                            topicId="${trendingTopic[1].id}"></ls:postCount></div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </g:else>
                            </ul>
                        </g:each>
                    </g:if>
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

                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>

                </div>

                <div class="card-body text-dark" style="padding: 5px;margin-top: 5px">
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
                                            <g:formatDate format=" hh:mm dd MMMM yyyy"
                                                          date="${resource.lastUpdated}"/>
                                        </div>
                                    </div>

                                    <div class="row" style="font-size: 15px">
                                        <b>Topic Name :</b><g:link controller="topic" action="show"
                                                                   params="[userId: resource.createdBy.id, topicId: resource.topic.id]"><b><u>${resource.topic.name}</u>
                                        </b></g:link>
                                    </div>

                                    <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                                        ${resource.description}
                                        ${resource.id}
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
                                            <g:if test="${resource.class == mainapp.DocumentResource}">
                                                <g:link controller="dashboard" action="download"
                                                        params="[postId: resource.id]"><u
                                                        style="margin-right:22px;">Download</u></g:link>
                                                <g:link controller="dashboard" action="isRead"
                                                        style="margin-right:22px;"><u>Mark as read</u></g:link>
                                                <g:link controller="post" action="show"
                                                        params="[userId: resource.createdBy.id, topicId: resource.topic.id, resourceId: resource.id]"><u>View Post</u></g:link>
                                            </g:if>

                                            <g:if test="${resource.class == mainapp.LinkResource}">
                                                <a style="margin-right: 22px" href="${resource.url}"
                                                   target="_blank"><u>View full site</u></a>
                                                <g:link controller="dashboard" action="isRead"
                                                        style="margin-right:22px;"><u>Mark as read</u></g:link>
                                                <g:link controller="post" action="show"
                                                        params="[userId: resource.createdBy.id, topicId: resource.id, resourceId: resource.id]"><u>View Post</u></g:link>
                                            </g:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </g:if>
                    </g:each>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>