<%@ page import="MainApp.Topic; MainApp.Topic; enums.Visibility; MainApp.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/a81c0d9f01.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:stylesheet src="showTopic/showTopic.css"/>
    <asset:javascript src="showTopic.js"/>
    <title>MainApp.Topic Page</title>
</head>

<body>
<g:render template="/showTopic/nabvar" model="${list4}"></g:render>

<g:if test="${flash.message}">
    <div class="alert alert-success"
         style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
</g:if>

<div class="container">
    <div class="row">
        <div class="col-lg-5">
%{--            <----------------------------------TOPIC-------------------------->--}%
            <div class="card border-dark mb-6" style="width: 30rem;margin-bottom: 50px">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <b>Topic : </b><b style="color: white">"${list.topic[0].name}"</b>
                </div>
                    <div class="card-body" style="padding: 10px;margin-left: 16px;margin-right: 16px">
                        <div class="row" style="background-color: #f1f1f1">
                            <div class="col-lg-3">
                                <img height="90" width="90"
                                     src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': list3.id])}"/>
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col">
                                        <g:link controller="showTopic" action="showtopic"><b><u>${list.topic[0].name}</u>
                                        </b></g:link>
                                        <g:if test="${list.topic.visibility == "Private"}"><b
                                                style="color: dimgrey">(Private)</b></g:if>
                                    </div>

                                    <div class="w-100"></div>

                                    <div class="col" style="color: dimgrey;">
                                        <b>@${list3[0].userName}</b>
                                    </div>

                                    <div class="col">
                                        <b style="color: dimgrey">Subscriptions</b>
                                    </div>

                                    <div class="col">
                                        <b style="color: dimgrey">Posts</b>
                                    </div>

                                    <div class="w-100"></div>

                                    <div class="col">

                                        <g:if test="${list.user.id.contains(session.userId)}">
                                            <g:link controller="dashboard" action="unsubscribe"><b><u>Unubscribe</u></b></g:link>
                                        </g:if>
                                        <g:else>
                                            ${list.topic.subscriptions.firstName}
                                            ${session.userFirstName}
                                            <g:link controller="dashboard" action="subscribe"><b><u>Subscribe</u></b></g:link>
                                        </g:else>

                                    </div>

                                    <div class="col" style="left: 25px">
                                        <g:link><b><u>${list.size()}</u></b></g:link>
                                    </div>

                                    <div class="col" style="left: 25px">
                                        <g:link><b><u>${list2.size()}</u></b></g:link>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom: 5px">
                                    <div class="col-lg-6"></div>

                                    <div class="col-lg-6">
                                        <g:select name="seriousness" from="${enums.Seriousness.values()}"></g:select>
                                        <a href="#" style="position:relative;left: 20px"><i class="fa fa-envelope fa-lg"
                                                                                            aria-hidden="true"
                                                                                            style="color:black;position: relative; right: 10px;font-size: 15px;bottom: 3px"
                                                                                            ;></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>

%{--            <--------------------------------USERS--------------------------->--}%
            <div class="card border-dark mb-6" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <span><b>Users : </b><b style="color: white">"${list[0].topic.name}"</b></span>
                    <span style="float:right;"><b><a href="#"><u style="color: white">View All</u></a></b></span>
                </div>
                <g:each in="${list}" var="${p}">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item" style="margin:5px">
                            <div class="row" style="background-color: #f1f1f1">
                                <div class="col-lg-3">
                                    <img height="90" width="90"
                                         src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p.user.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col">
                                            <b>${p.user.firstName + " "}${p.user.lastName}</b>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <b style="color: dimgrey">@${p.user.userName}</b>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <b style="color: dimgrey">Subscriptions</b>
                                        </div>
                                        <div class="col">
                                            <b style="color: dimgrey">Posts</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </g:each>
            </div>
        </div>

        <div class="col-lg-1">

        </div>


%{--        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<POSTS><>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--}%
        <div class="col-lg-6">
            <div class="card border-dark mb-6" style="width: 34rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <div class="row">
                        <div class="col" style="margin-top: 7px">
                            <b style="padding: 2px">Posts : "${list[0].topic.name}"</b>
                        </div>

                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>

                </div>

                <div class="card-body text-dark" style="padding: 5px;margin-top: 5px">
                    <g:each in="${list2}"  var="${p}">
                        <g:if test="${p.description!=null}">
                            <div class="row"
                                 style="background-color: #f1f1f1;margin-bottom: 10px;margin-right: 5px;margin-left: 5px">
                                <div class="col-lg-3">
                                    <img height="90" width="90"
                                         src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p.createdBy.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                                        <div class="col" style="padding: 0px">
                                            <b>${p.createdBy.firstName + " "}${p.createdBy.lastName + " "}</b>
                                        </div>

                                        <div class="col" style="padding: 0px">
                                            <b style="color: dimgrey; font-size: 15px">@${p.createdBy.userName}</b>
                                        </div>

                                        <div class="col-auto" style="font-size: 15px;padding:0px;color: dimgrey">
                                            <g:formatDate format=" hh:mm dd MMMM yyyy"
                                                          date="${p.topic.lastUpdated}"/>
                                        </div>
                                    </div>
%{--                                    <div class="row">--}%
%{--                                        <g:link controller="showTopic" action="showtopic" ><b><u>${p.topic.name}</u></b></g:link>--}%
%{--                                    </div>--}%

                                    <div class="row" style="padding-bottom: 5px;padding-top: 5px">

                                        ${p.description}

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
                                            <g:if test="${p.class != MainApp.LinkResource}">
                                                <g:link action="#" controller="#"><u
                                                        style="margin-right:22px;">Download</u></g:link>
                                                <g:link action="#" controller="#"><u
                                                        style="margin-right:22px;">Mark as read</u></g:link>
                                                <g:link  controller="post" action="showPost" params="[userId: p.createdBy.id,topicId:p.topic.id]"><u>View Post</u></g:link>
                                            </g:if>
                                            <g:if test="${p.class!=MainApp.DocumentResource}">
                                                <g:link action="#" controller="#"><u
                                                        style="margin-right:22px;">View Full Site</u></g:link>
                                                <g:link action="#" controller="#"><u style="margin-right:22px;">Mark as read</u></g:link>
                                                <g:link  controller="post" action="showPost" params="[userId: p.createdBy.id,topicId:p.topic.id]"><u>View Post</u></g:link>
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