<html>
<head>
    <title>

    </title>
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
    <asset:stylesheet src="style.css"/>
    <asset:javascript src="homePage.js"/>
</head>

<body>
<nav class="navbar navbar-dark bg-dark" style="margin-right: 55px;margin-right: 55px;border-radius: 8px">
    <a class="navbar-brand"><b>Link Sharing</b></a>
</nav>

<g:if test="${flash.message}">
    <div id="fm" class="alert alert-success"
         style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
</g:if>
%{--<---------------------------------------Recent Shares----------------------------------->--}%
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="card border-dark mb-6 " style="max-width: 35rem;">
                <div class="card-header" style="background-color: #343a40;color: white"><b><g:message
                        code="login.recentshares"></g:message></b></div>

                <div class="card-body text-dark" style="overflow: scroll;height: 270px">
                    <g:each in="${recentlySharedResource.take(5)}" var="${resource}">
                        <g:render template="/viewPost/topPost" model="[resource:resource]"></g:render>
                    </g:each>
                </div>
            </div>

            %{--            <-----------------------------_TOP POSTS------------------------->--}%

            <div class="card border-dark mb-6 " style="max-width: 35rem;max-height: 4000px;margin-top: 50px;">
                <div class="card-header" style="background-color: #343a40;color: white">
                    <span class="">
                        <b><g:message code="login.topposts"></g:message></b>
                    </span>
                    <span style="float: right">
                        <select id="cars">
                            <option value="volvo">Today</option>
                            <option value="saab">One week</option>
                            <option value="opel">One month</option>
                            <option value="audi">One year</option>
                        </select>
                    </span>
                </div>

                <div class="card-body text-dark" style="padding-bottom: 0px;overflow: scroll;max-height: 319px;height: auto">
                    <g:each in="${topPosts}" var="${post}">
                        <g:render template="/viewPost/topPost" model="[resource:post.resource]"></g:render>
                    </g:each>
                </div>
            </div>
        </div>

        <div class="col-lg-1"></div>

        <div class="col-lg-5">
            %{--        <------------------------------------LOGIN---------------------------------->--}%
            <g:render template="login"></g:render>

            %{--            <------------------------------REGISTER---------------------------->--}%
            <g:render template="register"></g:render>

        </div>
    </div>
</div>
</body>
</html>