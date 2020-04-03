<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
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
    <asset:stylesheet src="topic.css"/>
    <asset:javascript src="topic.js"/>
    <title>Profile</title>
</head>

<body>
<div class="container" style="background-color: #f1f1f1">
    <div class="row">

        <div class="col-lg-5">

            <div class="card border-dark mb-6" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white"><b>User</b></div>

                <div class="card-body text-dark " style="padding: 12px;margin-right: 15px">
                    <div class="row" style="background-color: #f1f1f1;margin-left: 1px">
                        <div class="col-lg-4">
                            <a href="${createLink(controller: "profile", action: "userProfile")}">
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
                                        <b><ls:subscriptionCount userId="${session.userId}"></ls:subscriptionCount></b>
                                    </div>

                                    <div class="col-lg-6" style="text-align: center;position:relative;right: 40px">
                                        <b><ls:topicCount userId="${session.userId}"></ls:topicCount></b>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="card border-dark mb-6 " style="max-width: 35rem;margin-bottom: 50px">

                <div class="card-header" style="background-color: #343a40;color: white">
                    <span><b>Topics</b><b style="color: white"></b></span>
                </div>

                <div class="card-body text-dark" style="overflow: scroll;height: 270px;padding-top: 10px">
                    <g:each in="${topicsCreatedByUser.take(5)}" var="${topic}">
                        <div class="row" style="background-color: #f1f1f1;margin-bottom: 10px;padding: 12px">
                            <div class="col-lg-5" style="font-size: 15px;">
                                <b>Topic :</b><g:link controller="topic" action="show"
                                                      params="[userId: topic.createdBy.id, topicId: topic.id]"><b><u>${topic.name}</u>
                                </b></g:link>
                            </div>

                            <div class="col-lg-4" style="font-size: 14px">
                                <b style="color: dimgrey">Subscriptions</b>
                            </div>

                            <div class="col-lg-3" style="font-size: 14px">
                                <b style="color: dimgrey">Post</b>
                            </div>

                            <div class="w-100"></div>

                            <div class="col-lg-6">
                            </div>

                            <div class="col">
                                <ls:subscriptionCount
                                        userId="${topic.createdBy.id}"></ls:subscriptionCount>
                            </div>

                            <div class="col" style="color: blue">
                                <ls:postCount topicId="${topic.id}"></ls:postCount>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>

            <div class="card border-dark mb-6 " style="max-width: 35rem;margin-bottom: 50px">

                <div class="card-header" style="background-color: #343a40;color: white">
                    <span><b>Subscriptions</b><b style="color: white"></b></span>
                </div>

                <div class="card-body text-dark" style="overflow: scroll;height: 270px;padding-top: 10px">
                    <g:each in="${subscriptionsOfUser.take(5)}" var="${subscription}">
                        <div class="row" style="background-color: #f1f1f1;margin-bottom: 10px;padding: 12px">
                            <div class="col-lg-5" style="font-size: 15px;">
                                <b>Topic :</b><g:link controller="topic" action="show"
                                                      params="[userId: subscription.user.id, topicId: subscription.topic.id]"><b><u>${subscription.topic.name}</u>
                                </b></g:link>
                            </div>

                            <div class="col-lg-4" style="font-size: 14px">
                                <b style="color: dimgrey">Subscriptions</b>
                            </div>

                            <div class="col-lg-3" style="font-size: 14px">
                                <b style="color: dimgrey">Post</b>
                            </div>

                            <div class="w-100"></div>

                            <div class="col-lg-6">
                            </div>

                            <div class="col">
                                <ls:subscriptionCount
                                        userId="${subscription.user.id}"></ls:subscriptionCount>
                            </div>

                            <div class="col" style="color: blue">
                                <ls:postCount topicId="${subscription.topic.id}"></ls:postCount>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>
            
        </div>


        <div class="col-lg-7" style="position:relative;left: 90px">
            <div class="card border-dark mb-6" style="width: 32rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <div class="row">
                        <div class="col" style="margin-top: 7px">
                            <b style="padding: 2px">Posts"</b>
                        </div>

                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>

                </div>

                <div class="card-body text-dark" style="padding: 5px;margin-top: 5px">
                    <g:if test="${postsOfUser}">
                        <g:each in="${postsOfUser}" var="post">
                            <div class="row"
                                 style="background-color: #f1f1f1;margin-bottom: 10px;margin-right: 5px;margin-left: 5px;padding-left: 10px">

                                <div class="col-lg-12">
                                    <div class="row" style="padding-bottom: 5px;padding-top: 5px">
                                    </div>

                                    <div class="row">
                                        <b>Topic Name :</b><g:link controller="topic" action="show"
                                                                   params="[userId: post.createdBy.id, topicId: post.topic.id]"><b><u>${post.topic.name}</u>
                                        </b></g:link>
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


                                        <div class="col-lg-9" style="font-size: 13px;padding: 0px;padding-left: 90px">
                                            <g:if test="${post.class != mainapp.LinkResource}">
                                                <g:link controller="dashboard" action="download"
                                                        params="[postId: post.id]"><u
                                                        style="margin-right:22px;">Download</u></g:link>
                                                <g:link action="#" controller="#"><u
                                                        style="margin-right:22px;">Mark as read</u></g:link>
                                                <g:link controller="post" action="show"
                                                        params="[userId: post.createdBy.id, topicId: post.topic.id, resourceId: post.id]"><u>View Post</u></g:link>
                                            </g:if>
                                            <g:if test="${post.class != mainapp.DocumentResource}">
                                                <a style="margin-right: 22px" href="${post.url}"
                                                   target="_blank"><u>View full site</u></a>
                                                <g:link action="#" controller="#"><u
                                                        style="margin-right:15px;">Mark as read</u></g:link>
                                                <g:link controller="post" action="show"
                                                        params="[userId: post.createdBy.id, topicId: post.topic.id, resourceId: post.id]"><u>View Post</u></g:link>
                                            </g:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </g:if>
                    <g:else>
                        NO POST YET
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>