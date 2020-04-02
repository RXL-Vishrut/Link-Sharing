<html>
<head>
    <title>

    </title>
    %{--        <meta name="layout" content="main"/>--}%


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
    <asset:stylesheet src="login/style.css"/>
    <asset:javascript src="homePage.js"/>
</head>

<body>

<nav class="navbar navbar-dark bg-dark" style="margin-right: 55px;margin-right: 55px;border-radius: 8px">
    <a class="navbar-brand"><b>Link Sharing</b></a>

    <form class="form-inline" style="margin-bottom: initial">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button style="position:relative;bottom: 5px" class="btn btn-secondary my-2 my-sm-0"
                type="submit">Search</button>
    </form>
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
                    <g:each in="${recent}" var="${p}">
                        <div class="row"
                             style="background-color: #f1f1f1;margin-left: -1px;margin-right: -1px;margin-bottom: 20px">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img height="110" width="110" style="padding-top: 7px;padding-left: 10px;border-radius: 20px"
                                         src="${createLink(controller: 'login', action: 'viewImage', params: ['userId': p.createdBy.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row" style="padding: 4px">
                                                <div class="col-lg-9" style="color: black">
                                                    <b>${p.createdBy.firstName + " "}${p.createdBy.lastName + "  "}</b>
                                                    <span style="font-size: 15px;position: relative;left: 120px">
                                                        <b>Topic :</b> <a
                                                            href="${createLink(controller: "login", action: "error")}"><b><u>${p.topic.name}</u>
                                                        </b></a>
                                                    </span>
                                                </div>

                                                <div style="font-size: 13px;font-weight: bold;display: inline;color: dimgrey;margin-left: 12px">
                                                    -<g:formatDate format=" hh:mm dd MMMM yyyy"
                                                                   date="${p.lastUpdated}"/>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="w-100"></div>

                                        <div class="col-lg-12" style="margin-left: 19px;word-break: break-all;">
                                            <div class="row">
                                                <p>${p.description}</p>
                                            </div>
                                        </div>

                                        <div class="w-100"></div>

                                        <div class="col-lg-12">
                                            <span style="margin-top: 4px;font-size: 17px">
                                                <a href="#"><i class="fa fa-facebook-f"
                                                               style="color: white;background-color:  #3b5998;margin-right: 10px;padding: 1px"></i>
                                                </a>
                                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                                               style="margin-right: 10px"></i>
                                                </a>
                                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                                               style="color: red"></i></a>
                                            </span>
                                            <span style="font-size: 12px;position:relative;left: 110px">
                                                <g:if test="${p.getClass() == mainapp.LinkResource}"><g:link
                                                        controller="login" action="error"><b><u>View Full Site</u>
                                                    </b></g:link>
                                                </g:if>
                                                <g:else><u><g:link controller="login"
                                                                   action="error"><b>Download</b></g:link></u>
                                                </g:else>
                                            </span>
                                            <span style="position:relative;left: 120px">
                                                <a href="${createLink(controller: "login", action: "error")}"
                                                   style="font-size:12px"><u><b>View Post</b></u></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
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

                <div class="card-body text-dark" style="padding-bottom: 0px">
                    <g:each in="${list}" var="${p}">
                        <div class="row"
                             style="background-color: #f1f1f1;margin-left: -1px;margin-right: -1px;margin-bottom: 20px">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img height="110" width="110" style="padding-top: 7px;padding-left: 10px;border-radius: 20px"
                                         src="${createLink(controller: 'login', action: 'viewImage', params: ['userId': p.resource.createdBy.id])}"/>
                                </div>

                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row" style="padding: 4px">
                                                <div class="col-lg-9" style="color: black">
                                                    <b>${p.resource.createdBy.firstName + " "}${p.resource.createdBy.lastName + "  "}</b>
                                                    <span style="font-size: 15px;position: relative;left: 120px">
                                                        <b>Topic :</b> <a
                                                            href="${createLink(controller: "login", action: "error")}"><b><u>${p.resource.topic.name}</u>
                                                        </b></a>
                                                    </span>
                                                </div>

                                                <div style="font-size: 13px;font-weight: bold;display: inline;color: dimgrey;margin-left: 12px">
                                                    -<g:formatDate format=" hh:mm dd MMMM yyyy"
                                                                   date="${p.resource.lastUpdated}"/>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="w-100"></div>

                                        <div class="col-lg-12" style="margin-left: 19px;word-break: break-all;">
                                            <div class="row">
                                                <p>${p.resource.description}</p>
                                            </div>
                                        </div>

                                        <div class="w-100"></div>

                                        <div class="col-lg-12">
                                            <span style="margin-top: 4px;font-size: 17px">
                                                <a href="#"><i class="fa fa-facebook-f"
                                                               style="color: white;background-color:  #3b5998;margin-right: 10px;padding: 1px"></i>
                                                </a>
                                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"
                                                               style="margin-right: 10px"></i>
                                                </a>
                                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                                               style="color: red"></i></a>
                                            </span>
                                            <span style="font-size: 12px;position:relative;left: 110px">
                                                <g:if test="${p.resource.getClass() == mainapp.LinkResource}"><g:link
                                                        controller="login" action="error"><b><u>View Full Site</u>
                                                    </b></g:link>
                                                </g:if>
                                                <g:else><u><g:link controller="login"
                                                                   action="error"><b>Download</b></g:link></u>
                                                </g:else>
                                            </span>
                                            <span style="position:relative;left: 120px">
                                                <a href="${createLink(controller: "login", action: "error")}"
                                                   style="font-size:12px"><u><b>View Post</b></u></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
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


<script>

</script>
</body>
</html>