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
    <asset:stylesheet src="style.css"/>
    <title>Search</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-5">
            %{--            <--------------------------------Trending--TOPIC-------------------------->--}%
            <div class="card border-dark mb-6" style="width: 32rem;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <b>TRENDING TOPICS</b>
                </div>

                <div class="card-body text-dark" style="max-height: 319px;height: auto;overflow: scroll">
                    <g:if test="${trendingTopics}">
                        <g:each in="${trendingTopics}" var="trendingTopic">
                            <g:render template="/topic/topicInfo" model="[topic: trendingTopic[1]]"></g:render>
                        </g:each>
                    </g:if>
                    <g:else>
                        NO TOPIC YET
                    </g:else>
                </div>
            </div>

            %{--            <--------------------------------Top Posts--------------------------->--}%

            <div class="card border-dark mb-6 " style="width: 32rem;max-height: 4000px;margin-top: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <span class="">
                        <b><g:message code="login.topposts"></g:message></b>
                    </span>
                    <span style="float: right">
                        <select id="postTime">
                            <option value="volvo">Today</option>
                            <option value="saab">One week</option>
                            <option value="opel">One month</option>
                            <option value="audi">One year</option>
                        </select>
                    </span>
                </div>

                <div class="card-body text-dark"
                     style="padding-bottom: 0px;overflow: scroll;max-height: 319px;height: auto">
                    <g:if test="${topPosts}">
                        <g:each in="${topPosts}" var="${post}">
                            <g:render template="/viewPost/topPost" model="[resource:post.resource]"></g:render>
                        </g:each>
                    </g:if>
                    <g:else>
                        NO POST YET
                    </g:else>
                </div>
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
                            <b style="padding: 2px">POSTS </b>
                        </div>
                    </div>

                </div>

                <div class="card-body text-dark" style="padding: 5px;margin-top: 5px">
                    <g:if test="${resources}">
                        <g:each in="${resources}" var="post">
                            <g:render template="/viewPost/postOfTopic" model="[post:post]"></g:render>
                        </g:each>
                    </g:if>
                    <g:else>
                        NO POST FOUND WITH THIS NAME
                    </g:else>
                </div>
            </div>

        <div class="card border-dark mb-6" style="width: 34rem;margin-top: 86px">
            <div class="card-header" style="background-color: #343a40;color: white">
                <div class="row">
                    <div class="col" style="margin-top: 7px">
                        <b style="padding: 2px">TOPICS</b>
                    </div>
                </div>

            </div>

            <div class="card-body text-dark" style="padding: 5px;margin-top: 5px">
                <g:if test="${topics}">
                    <g:each in="${topics}" var="topic">
                        <g:render template="/topic/topicInfo" model="[topic: topic]"></g:render>
                    </g:each>
                </g:if>
                <g:else>
                    NO TOPICS FOUND WITH THIS NAME
                </g:else>
            </div>
        </div>

        </div>
    </div>
</div>
</body>
</html>