<%@ page import="mainapp.Topic; java.beans.Visibility" %>
<!DOCTYPE html>
<html lang="en" xmlns:hidden="http://www.w3.org/1999/xhtml">
<head>
    <meta name="layout" content="main"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
    <script src="//cdn.ckeditor.com/4.6.0/full-all/ckeditor.js"></script>

</head>

<body>
%{--<----------------------------------------Photo Section------------------------------------->--}%

<div class="container" style="background-color: #f1f1f1">
    <g:if test="${flash.message}">
        <div id="fm" class="alert alert-success"
             style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
    </g:if>
    <div id="trash" style="text-align: center;background-color: #b2d1ff;color: black"></div>

    <div id="trashdanger" style="text-align: center; background-color: red;color: white"></div>

    <div id="private" style="text-align: center;background-color: #b2d1ff;color: black"></div>
    <div class="row">

        <div class="col-lg-6">
            <div class="card-header"
                 style="background-color: #343a40;color: white;position:relative;top: 3px;width: 32rem"><b>User</b>
            </div>
            <g:render template="/userProfile/profileInfo"></g:render>


            %{--            <-----------------------------subscriptions---------------------------------->--}%
            <div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <span><b>Subscriptions</b></span>
                    <span style="float:right"><b><a href="${createLink(controller: "topic", action: "showAllTopics")}"><u
                            style="color: white">View All</u></a></b></span>
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
                            <g:render template="/topic/topicInfo" model="[topic: trendingTopic[1]]"></g:render>
                        </g:each>
                    </g:if>
                    <g:else>
                        <div class="alert-danger" style="text-align: center">
                            NO TRENDING TOPICS YET
                        </div>
                    </g:else>
                </div>
            </div>
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

                <div class="card-body text-dark"
                     style="padding: 5px;margin-top: 5px;overflow: scroll;height: auto;max-height: 700px">
                    <g:if test="${readingItems}">
                        <g:each in="${readingItems}" var="readingItem">
                            <g:render template="/viewPost/postOfTopic" model="[resource:readingItem.resource]"></g:render>
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