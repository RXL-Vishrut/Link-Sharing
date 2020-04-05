<%@ page contentType="text/html;charset=UTF-8" %>
<html>
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
    <asset:stylesheet src="profileNav.css"/>
    <asset:javascript src="updatePassword.js"/>
</head>

<body>

<g:if test="${flash.message}">
    <div id="fm" class="alert alert-success"
         style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
</g:if>

<div class="container" style="background-color: #f1f1f1">
    <div class="row">
        <div class="col-lg-5">
            <div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white"><b>User</b></div>

                <div class="card-body text-dark " style="padding: 12px;margin-right: 15px">
                    <div class="row" style="background-color: #f1f1f1;margin-left: 1px">
                        <div class="col-lg-4">
                            <img style="width: 110px;height: 110px;padding: 4px;border-radius: 15px"
                                 src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/>
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
                                        <ls:subscriptionCount userId="${session.getAttribute("userId")}"></ls:subscriptionCount>
                                    </div>

                                    <div class="col-lg-6" style="text-align: center;position:relative;right: 40px">
                                        <ls:topicCount userId="${session.getAttribute("userId")}"></ls:topicCount>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-7" style="position:relative;left: 70px">
            <g:render template="/editProfile/updateUserInfo"></g:render>
            <g:render template="/editProfile/changePassword"></g:render>
        </div>

    </div>
</div>
</body>
</html>