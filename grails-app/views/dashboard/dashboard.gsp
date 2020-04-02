<%@ page import="mainapp.Topic; java.beans.Visibility" %>
<!DOCTYPE html>
<html lang="en">
<head>
            <meta name="layout" content="main"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
                            <a href="${createLink(controller: "profile", action: "showProfile")}">
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
                                        <g:link controller="#" action="#"><b>${list2[0]}</b></g:link>
                                    </div>

                                    <div class="col-lg-6" style="text-align: center;position:relative;right: 40px">
                                        <g:link controller="#" action="#"><b>${list2[1]}</b></g:link>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <g:render template="subscription"></g:render>





            %{--            <------------------------------TRENDING TOPICS----------------------------->--}%
            <div class="card border-dark mb-6" style="width: 32rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <b>Trending Topics</b>
                </div>

                <div class="card-body text-dark" style="height: 284px;overflow: scroll">
                    <g:if test="${list1}">
                        <g:each in="${list1}" var="${p}">
                            <ul class="list-group list-group-flush">
                                <g:if test="${p[1].createdBy.email == session.userEmail}">
                                    <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <img height="90" width="90" style="border-radius: 8px"
                                                     src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p[1].createdBy.id])}"/>
                                            </div>

                                            <div class="col-lg-9" style="font-size: 15px">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <g:link controller="topic"
                                                                action="topic" params="[userId:p[1].createdBy.id,topicId: p[1].id]"><b><u>${p[1].name}</u>
                                                        </b></g:link>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-5"><b
                                                            style="color: dimgrey">@${p[1].createdBy.userName}</b>
                                                    </div>

                                                    <div class="col" style="display: contents"><b>Subscriptions</b>
                                                    </div>

                                                    <div class="col"><b>Posts</b></div>

                                                    <div class="w-100"></div>

                                                    <div class="col-lg-5">
                                                        <g:link controller="dashboard"
                                                                action="unsubscribe"><b><u>Unsubscribe</u>
                                                        </b></g:link></div>

                                                    <div class="col-lg-4" style="text-align: center">50</div>

                                                    <div class="col-lg-3">40</div>
                                                </div>

                                                <div class="row" style="margin-top: 4px">
                                                    <div class="col">
                                                        <g:select name="visibility"
                                                                  from="${enums.Visibility.values()}"></g:select>
                                                    </div>

                                                    <div class="col">
                                                        <g:select name="seriousness"
                                                                  from="${enums.Seriousness.values()}"></g:select>
                                                    </div>

                                                    <div class="col">
                                                        <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                                                       style="color:black;position: relative; right: 10px;font-size: 15px;bottom: 3px"
                                                                       ;></i></a>
                                                        <a href="#"><i class="fa fa-pencil-square-o fa-lg"
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
                                                     src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p[1].createdBy.id])}"/>
                                            </div>

                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <g:link controller="topic"
                                                                action="topic" params="[userId:p[1].createdBy.id,topicId: p[1].id]"><b><u>${p[1].name}</u>
                                                        </b></g:link>
                                                    </div>
                                                </div>

                                                <div class="row" style="font-size: 15px">
                                                    <div class="col-lg-5"><b
                                                            style="color: dimgrey">@${p[1].createdBy.userName}</b>
                                                    </div>

                                                    <div class="col" style="display: contents"><b>Subscriptions</b>
                                                    </div>

                                                    <div class="col"><b>Posts</b></div>

                                                    <div class="w-100"></div>

                                                    <div class="col-lg-5">
                                                        <g:if test="${list.topic.name.contains(p[1].name)}">
                                                            <g:link controller="dashboard" action="unsubscribe"
                                                                    params="[userId: session.getAttribute('userId'), topicId: p[1].id]"><b><u>Unsubscribe</u>
                                                            </b></g:link>
                                                        </g:if>
                                                        <g:else>
                                                            <g:link controller="dashboard"
                                                                    action="subscribe"
                                                                    params="[userId: session.getAttribute('userId'), topicId: p[1].id]"><b><u>Subscribe</u>
                                                            </b></g:link>
                                                        </g:else>
                                                    </div>

                                                    <div class="col-lg-4" style="text-align: center">50</div>

                                                    <div class="col-lg-3">40</div>

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
                    <g:each in="${list3}" var="${p}">
                        <g:if test="${p.resources.description[0] != null}">
                            <div class="row"
                                 style="background-color: #f1f1f1;margin-bottom: 10px;margin-right: 5px;margin-left: 5px">
                                <div class="col-lg-3" style="margin-top: 10px">
                                    <img height="110" width="90" style="border-radius: 15px"
                                         src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p.createdBy.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                                        <div class="col" style="padding: 0px;position:relative;top: 3px">
                                            <b>${p.createdBy.firstName + " "}${p.createdBy.lastName + " "}</b>
                                        </div>

                                        <div class="col" style="padding: 0px;top: 2px">
                                            <b style="color: dimgrey; font-size: 15px">@${p.createdBy.userName}</b>
                                        </div>

                                        <div class="col-auto"
                                             style="font-size: 15px;padding:0px;color: dimgrey;top: 4px">
                                            <g:formatDate format=" hh:mm dd MMMM yyyy"
                                                          date="${p.lastUpdated}"/>
                                        </div>
                                    </div>

                                    <div class="row" style="font-size: 15px">
                                        <b>Topic Name :</b><g:link controller="topic" action="show"
                                                                   params="[userId: p.createdBy.id, topicId: p.id]"><b><u>${p.name}</u>
                                        </b></g:link>
                                    </div>

                                    <div class="row" style="padding-bottom: 5px;padding-top: 5px">

                                        ${p.resources.description[0]}
                                        ${p.resources.id[0]}
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
                                            <g:if test="${p.resources[0].class != mainapp.LinkResource}">
                                                <g:link controller="dashboard" action="download"
                                                        params="[postId: p.resources[0].id]"><u
                                                        style="margin-right:22px;">Download</u></g:link>
                                                <g:link controller="dashboard" action="isRead" params="[userId: p.createdBy.id,resourceId:p.resources[0].id]"><u
                                                        style="margin-right:22px;">Mark as read</u></g:link>
                                                <g:link controller="post" action="show"
                                                        params="[userId: p.createdBy.id, topicId: p.id, resourceId: p.resources[0].id]"><u>View Post</u></g:link>
                                            </g:if>
                                            <g:if test="${p.resources[0].class != mainapp.DocumentResource}">
                                                <g:link action="#" controller="#"><u
                                                        style="margin-right:22px;">View Full Site</u></g:link>
                                                <g:link action="#" controller="#" id="read"><u
                                                        style="margin-right:22px;">Mark as read</u></g:link>
                                                <g:link controller="post" action="show"
                                                        params="[userId: p.createdBy.id, topicId: p.id, resourceId: p.resources[0].id]"><u>View Post</u></g:link>
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