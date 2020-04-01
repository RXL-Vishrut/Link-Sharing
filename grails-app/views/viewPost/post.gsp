<%@ page contentType="text/html;charset=UTF-8" %>
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
    <asset:stylesheet src="/post/viewPost.css"/>
%{--    <asset:javascript src="showTopic.js"/>--}%
    <title>Post Page</title>
</head>

<body>
<script type="text/javascript" src="jquery.min.js"></script>

<script type="text/javascript" src="jquery.rateyo.min.js"></script>

<g:render template="/viewPost/navbarPost"></g:render>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="card border-dark mb-6">
                <div class="card-body" style="margin-right: 40px;padding-bottom: 0px;margin: 10px;background-color: #f1f1f1">
                    <div class="row">
                        <div class="col-lg-4">
                            <img height="80" width="100"
                                 src="${createLink(controller: 'post', action: 'viewImage', params: ['userId': user.id])}"/>
                        </div>

                        <div class="col-lg-8">
                            <div class="row">
                                <div style="font-size: 20px">
                                    <b>${user.firstName + " "}${user.lastName}</b>
                                </div>
                                <div style="font-size: 20px;margin-left: 100px">
                                    <g:link><u><b>${topic.name}</b></u></g:link>
                                </div>
                                <div class="w-100"></div>

                                <div style="color: dimgrey">
                                    <b>@${user.userName}</b>
                                </div>
                                <div style="color: dimgrey;margin-left: 126px;font-size: 12px">
                                    <b><g:formatDate format=" hh:mm dd MMMM yyyy"
                                                     date="${topic.lastUpdated}"/></b>
                                </div>
                                <div class="w-100"></div>

                            </div>

                        </div>
                    </div>
                    <div class="row" style="margin-top: 15px;margin-left: 0px">
                        ${topic.resources.description[0]}
                    </div>
                    <div class="row" style="padding: 4px;margin-bottom: 2px">
                        <div class="col-lg-4" style="margin-bottom: 8px;font-size: 25px">
                            <a href="#"><i class="fa fa-facebook-f"
                                           style="color: white;background-color:  #3b5998;margin-right: 10px;padding: 1px"></i>
                            </a>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                           style="margin-right: 10px"></i>
                            </a>
                            <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                           style="color: red"></i></a>
                        </div>

                        <div class="col-lg-8" style="top: 5px;left: 70px">
                            <a style="font-size: 12px;margin-right: 3px"  href="${createLink(controller: "login",action: "error")}" style="font-size:15px"><u><b>Delete</b></u></a>
                            <a style="font-size: 12px;margin-right: 3px" href="${createLink(controller: "login",action: "error")}" style="font-size:15px"><u><b>Edit</b></u></a>
                            <a style="font-size: 12px;margin-right: 3px" href="${createLink(controller: "login",action: "error")}" style="font-size:15px"><u><b>Download</b></u></a>
                            <a style="font-size: 12px;margin-right: 3px" href="${createLink(controller: "login",action: "error")}" style="font-size:15px"><u><b>View Full Site</b></u></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6" style="">

            <div class="card border-dark mb-6" style="width: 32rem;left:20px">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <b>Trending Topics</b>
                </div>

                <div class="card-body text-dark" style="height: 284px;overflow: scroll">
                    <g:each in="${list1}" var="${p}">
                        <ul class="list-group list-group-flush">
                        <g:if test="${p[1].createdBy.email == session.userEmail}">
                            <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
                                <div class="row">
                                    <div class="col-lg-3">

                                        <img height="90" width="90"
                                             src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p[1].createdBy.id])}"/>
                                    </div>

                                    <div class="col-lg-9" style="font-size: 15px">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <g:link controller="#" action="#"><u><b>${p[1].name}</b>
                                                </u></g:link>
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
                                                <g:link controller="dashboard" action="unsubscribe"
                                                        params="[userId: p[1].createdBy.id, topicId: p[1].id]"><b><u>Unsubscribe</u>
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
                                            <img height="90" width="90"
                                                 src="${createLink(controller: 'dashboard', action: 'viewImage', params: ['userId': p[1].createdBy.id])}"/>
                                        </div>

                                        <div class="col-lg-9">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <g:link controller="showTopic"
                                                            action="topic"><b><u>${p[1].name}</u>
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
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>