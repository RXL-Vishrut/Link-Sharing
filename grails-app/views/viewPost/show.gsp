<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--}%
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    %{--    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--}%
    %{--            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--}%
    %{--            crossorigin="anonymous"></script>--}%
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <asset:stylesheet src="dashboard.css"/>
    <asset:javascript src="post.js"/>
    <asset:javascript src="dashboard.js"/>
    <title>Post Page</title>
</head>

<body>

<div class=" alert-danger"style="text-align: center" hidden>
</div>
<div class="alert-success" style="text-align: center" hidden></div>
<div class="container">


    <div class="row">
        <div class="col-lg-6">
            <div class="card border-dark mb-6">
                <div class="card-body"
                     style="margin-right: 40px;padding-top: 12px;padding-bottom:0px;margin: 10px;background-color: #f1f1f1">
                    <div class="row">
                        <div class="col-lg-3">
                            <img height="100" width="100" style="border-radius: 8px"
                                 src="${createLink(controller: 'post', action: 'viewImage', params: ['userId': resource.createdBy.id])}"/>
                        </div>

                        <div class="col-lg-9">
                            <div class="row">
                                <div style="font-size: 20px">
                                    <b>${resource.createdBy.firstName + " "}${resource.createdBy.lastName}</b>
                                </div>

                                <div  style="font-size: 20px;position:relative;left: 150px">
                                    <g:link controller="topic"
                                            action="show"
                                            params="[topicId: resource.topic.id]"><u><b>${resource.topic.name}</b></u></g:link>
                                </div>

                                <div class="w-100"></div>

                                <div style="color: dimgrey">
                                    <b>@${resource.createdBy.userName}</b>
                                </div>

                                <div style="color: dimgrey;position:relative;left: 190px;font-size: 12px">
                                    <b><g:formatDate format=" hh:mm dd MMMM yyyy"
                                                     date="${resource.topic.lastUpdated}"/></b>
                                </div>

                                <div class="w-100"></div>

                                <div class="col">

                                </div>

                                <div class="col" style="position:relative;left: 15px">
                                    <div id="rating" hidden>${resourceRating}</div>
                                    <div id="rateYo">
                                    </div>
                                    <div id="successMessage"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="postEdit" hidden style="margin-top:5px">
                        <g:textArea name="topic" class="postName" placeholder="${resource.description}" style="width: 338px;height: 72px;text-align: left"></g:textArea>
                        <div id="res" hidden>${resource.id}</div>
                        <button type="submit" name="save" resourceId="${resource.id}" style="position:relative;bottom:51px"
                                class="postSave">Save</button>
                        <button type="submit" name="cancel" style="position:relative;bottom:51px"
                                class="postCancel ">Cancel</button>
                    </div>
                    <div class="row postDes" style="margin-top: 15px;margin-left: 0px">
                        ${resource.description}
                    </div>

                    <div class="row" style="padding: 4px;margin-bottom: 2px">
                        <div class="col-lg-4" style="margin-bottom: 8px;font-size: 20px">
                            <a href="#"><i class="fa fa-facebook-f"
                                           style="color: white;background-color:  #3b5998;margin-right: 10px;padding: 1px"></i>
                            </a>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                           style="margin-right: 10px"></i>
                            </a>
                            <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                           style="color: red"></i></a>
                        </div>
                        <div class="col-lg-8" style="text-align: right;">
                            <g:link controller="post" action="deletePost" params="[resourceId: resource.id]"><b><u>Delete</u></b></g:link>
                            <a style="font-size: 15px;margin-right: 3px;margin-left:3px;color: blue;cursor: pointer" class="editPost" resourceId="${resource.id}"><u><b>Edit</b></u></a>
                            <g:if test="${resource.class == mainapp.DocumentResource}">
                                <a style="font-size: 15px;margin-right: 3px"
                                   href="${createLink(controller: "dashboard", action: "download")}"><u><b>Download</b>
                                </u></a>
                            </g:if>
                            <g:if test="${resource.class == mainapp.LinkResource}">
                                <a style="font-size: 15px;margin-right: 3px"
                                   href="${resource.url}" target="_blank"><u><b>View Full Site</b>
                                </u></a>
                            </g:if>

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

                <div class="card-body text-dark" style="max-height: 284px;overflow: scroll;height: auto">
                    <g:if test="${trendingTopics}">
                        <g:each in="${trendingTopics}" var="trendingTopic">
                            <g:render template="/topic/topicInfo" model="[topic: trendingTopic[1]]"></g:render>
                        </g:each>
                    </g:if>
                    <g:else>
                        NO TRENDING TOPICS YET
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>