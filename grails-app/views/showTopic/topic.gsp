<%@ page import="MainApp.Topic; MainApp.Topic; enums.Visibility; MainApp.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="showTopic/showTopic.css"/>
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
    <title>MainApp.Topic Page</title>
</head>

<body>
<g:render template="nabvar"></g:render>

<g:if test="${flash.message}">
    <div class="alert alert-success"
         style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
</g:if>

<div class="container">
    <div class="row">
        <div class="col-lg-5">
            <g:each in="${userList}">
                <div class="card border-dark mb-6" style="width: 30rem;margin-bottom: 50px">
                    <div class="card-header" style="background-color: #343a40;color: white">
                        <b>Topic :</b><b style="color: white">"${userList.topic.name}"</b>
                    </div>

                    <div class="card-body" style="padding: 5px;margin-left: 16px;margin-right: 16px">
                        <div class="row" style="background-color: #f1f1f1">
                            <div class="col-lg-3">
                                photo
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col">
                                        <g:link controller="showTopic" action="topic"><b><u>${userList.topic.name}</u></b></g:link>
                                        <g:if test="${userList.visibility == "Private"}"><b
                                                style="color: dimgrey">(Private)</b></g:if>
                                    </div>

                                    <div class="w-100"></div>

                                    <div class="col" style="color: dimgrey;">
                                        <b>@${userList.createdBy.userName}</b>
                                    </div>

                                    <div class="col">
                                        <b style="color: dimgrey">Subscriptions</b>
                                    </div>

                                    <div class="col">
                                        <b style="color: dimgrey">Posts</b>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <g:link controller="#" action="#"><b><u>Subscribe</u></b></g:link>
                                    </div>

                                    <div class="col"></div>

                                    <div class="col"></div>
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

            </g:each>


            <div class="card border-dark mb-6" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <span><b>Users :</b><b style="color: white">"${userList.name}"</b></span>
                    <span style="float:right;"><b><a href="#"><u style="color: white">View All</u></a></b></span>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="padding-bottom: 0px">
                        <div class="row">
                            <div class="col-lg-3"></div>

                            <div class="col-lg-9">
                                <div class="row">

                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">

                    </li>
                </ul>
            </div>
        </div>

        <div class="col-lg-1">

        </div>

        <div class="col-lg-6">

        </div>
    </div>
</div>

</body>
</html>