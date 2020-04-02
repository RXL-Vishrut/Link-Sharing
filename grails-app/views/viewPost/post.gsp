<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    <asset:stylesheet src="/post/viewPost.css"/>
    <asset:javascript src="post.js"/>
    <title>Post Page</title>
</head>

<body>

<g:render template="/viewPost/navbarPost" model="[list: list]"></g:render>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="card border-dark mb-6">
                <div class="card-body"
                     style="margin-right: 40px;padding-top: 12px;padding-bottom:0px;margin: 10px;background-color: #f1f1f1">
                    <div class="row">
                        <div class="col-lg-3">
                            <img height="100" width="100" style="border-radius: 8px"
                                 src="${createLink(controller: 'post', action: 'viewImage', params: ['userId': user.id])}"/>

                        </div>

                        <div class="col-lg-9">
                            <div class="row">
                                <div style="font-size: 20px">
                                    <b>${user.firstName + " "}${user.lastName}</b>
                                </div>

                                <div style="font-size: 20px;position:relative;left: 150px">
                                    <g:link><u><b>${topic.name}</b></u></g:link>
                                </div>

                                <div class="w-100"></div>

                                <div style="color: dimgrey">
                                    <b>@${user.userName}</b>
                                </div>

                                <div style="color: dimgrey;position:relative;left: 190px;font-size: 12px">
                                    <b><g:formatDate format=" hh:mm dd MMMM yyyy"
                                                     date="${topic.lastUpdated}"/></b>
                                </div>

                                <div class="w-100"></div>

                                <div class="col">

                                </div>

                                <div class="col" style="position:relative;left: 30px">
%{--                                    ${resource.id}--}%
                                    <div class="rating">
                                        %{--                                        <g:uploadForm url="[controller: 'post', action: 'rating']">--}%
                                        <input type="radio" id="star5" name="rating" value="5"/><label for="star5"
                                                                                                       title="Exceptional">5 stars</label>
                                        <input type="radio" id="star4" name="rating" value="4"/><label for="star4"
                                                                                                       title="Excellent">4 stars</label>
                                        <input type="radio" id="star3" name="rating" value="3"/><label for="star3"
                                                                                                       title="Nice">3 stars</label>
                                        <input type="radio" id="star2" name="rating" value="2"/><label for="star2"
                                                                                                       title="Kinda bad">2 stars</label>
                                        <input type="radio" id="star1" name="rating" value="1"/><label for="star1"
                                                                                                       title="Very bad">1 star</label>
                                        %{--                                        </g:uploadForm>--}%
                                        <div class="res" hidden>${resource.id}</div>

                                        <div id="message"></div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px;margin-left: 0px">
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

                        <div class="col-lg-8" style="top: 5px;left: 50px">
                            <a style="font-size: 15px;margin-right: 3px"
                               href="${createLink(controller: "login", action: "error")}"><u><b>Delete</b></u></a>
                            <a style="font-size: 15px;margin-right: 3px"
                               href="${createLink(controller: "login", action: "error")}"><u><b>Edit</b></u></a>
                            <a style="font-size: 15px;margin-right: 3px"
                               href="${createLink(controller: "login", action: "error")}"><u><b>Download</b></u></a>
                            <a style="font-size: 15px;margin-right: 3px"
                               href="${createLink(controller: "login", action: "error")}"><u><b>View Full Site</b></u></a>
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
                                                    <g:link controller="topic"
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
%{--<script>--}%
%{--    var rate = function(){--}%
%{--        $.ajax({--}%
%{--            url: "/post/rating/",--}%
%{--            type: "POST",--}%
%{--            data:{"value": $("input[type='radio'][name='rating']:checked").val() },--}%
%{--            success: function (data) {--}%
%{--                if(data.success==true){--}%
%{--                    alert("success")--}%
%{--                }else{--}%
%{--                    alert("failed")--}%
%{--                }--}%
%{--            },--}%
%{--            error: function () {--}%
%{--                alert("Topic save failed")--}%
%{--            }--}%

%{--        });--}%
%{--    };--}%

%{--    $(document).ready(function(){--}%
%{--        $("#star1,#star2,#star3,#star4,#star5").click(function(){--}%
%{--            console.log("done");--}%
%{--            rate();--}%
%{--        })--}%
%{--    });--}%
%{--</script>--}%
</body>

</html>