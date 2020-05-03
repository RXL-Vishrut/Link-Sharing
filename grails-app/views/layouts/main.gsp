<%@ page import="mainapp.Topic; java.beans.Visibility" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Link Sharing"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="img" href="ls.png" type="image/png"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <asset:stylesheet src="dashboard.css"/>
    <asset:javascript src="dashboard.js"/>
    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-dark bg-dark navbar-expand-lg" id="navbar">
    <div class="container-fluid">
        <div class="navbar-header" style="width: 218px">
            <a class="navbar-brand nav-link"
               href="${createLink(controller: "dashboard", action: "show")}"><b>Link Sharing</b>
            </a>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <button class="btn nav-link" data-toggle="modal" data-target="#exampleModalCenter"
                        style="line-height: 1;padding: .375rem"><i
                        class="fa fa-comment nav-link"
                        style="color: white; font-size: 20px"></i>
                    <b class="nav-link" style=" color: white; font-size: 15px">CREATE TOPIC</b>
                </button>

                <form>
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle"><b>CREATE TOPIC</b></h5>

                                    <div class="alert-danger" id="topicError"
                                         style="text-align: center;position:relative;left: 31px"></div>

                                    <div class="alert-success" id="topicSuccess"
                                         style="text-align: center;position:relative;left: 31px"></div>

                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>

                                </div>

                                <div class="modal-body">
                                    <div class="row " style="margin-top: 20px; ">
                                        <label for="inputTopicName" class="col-sm-5 col-form-label"><b><g:message
                                                code="dashboard.topic.name"></g:message></b></label>

                                        <div class="col-sm-7"><input type="text" id="inputTopicName" name="name"
                                                                     class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                     placeholder="Name" required>
                                        </div>
                                    </div>


                                    <label for="visibility" class="col-sm-5 col-form-label"
                                           style="padding-left: initial"><b><g:message
                                            code="dashboard.topic.visibility"></g:message></b></label>

                                    <div class="col-sm-6 " style="display: inline-grid">
                                        <g:select name="visibility" from="${enums.Visibility?.values()}" value="${vis}"
                                                  id="visibility"/>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" id="saveTopic">Create</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </li>
            <li><button class="btn" data-toggle="modal" data-target="#exampleModalCenter3" style="line-height: 1"><i
                    class="fa fa-file nav-link"
                    style="color: white; font-size: 20px"></i>
                <b class="nav-link" style="color: white; font-size: 15px">SHARE DOCUMENT</b>
            </button>
                <g:uploadForm enctype="multipart/form-data" url='[controller: "post", action: "shareDoc"]'>
                    <div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle"><b>SHARE DOCUMENT</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="row " style="margin-top: 20px; ">
                                        <label for="customFile" class="col-sm-5 col-form-label"><b><g:message
                                                code="dashboard.document"></g:message></b></label>

                                        <div class="custom-file mb-3 col-sm-7">
                                            <input type="file" name="document" class="custom-file-input" id="customFile"
                                                   required>
                                            <label class="custom-file-label " for="customFile" required></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label for="docDescription" class="col-sm-5 col-form-label"><b><g:message
                                                code="dashboard.description"></g:message></b></label>

                                        <div class="col-sm-7"><textarea id="docDescription" name="docdescription"
                                                                        class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                        placeholder="Description" required></textarea>
                                        </div>
                                    </div>

                                    <label for="inputTopic" class="col-sm-5 col-form-label"
                                           style="padding-left: initial"><b><g:message
                                            code="dashboard.link.topic"></g:message></b></label>

                                    <div class="col-sm-6 " style="display: inline-grid">
                                        <ls:showSubscribedTopics userId="${session.userId}"></ls:showSubscribedTopics>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" id="shareDoc ">Share</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </g:uploadForm></li>
            <li><button class="btn" data-toggle="modal" data-target="#exampleModalCenter1" style="line-height: 1"><i
                    class="fa fa-link nav-link"
                    style="color: white; font-size: 20px"></i>
                <b class="nav-link" style="color: white; font-size: 15px">SHARE LINK</b>
            </button>
                <g:uploadForm url='[controller: "post", action: "shareLink"]'>
                    <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle1"><b>SHARE LINK</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="row " style="margin-top: 20px; ">
                                        <label for="inputLink" class="col-sm-5 col-form-label"><b><g:message
                                                code="dashboard.link"></g:message></b></label>

                                        <div class="col-sm-7"><input type="url" id="inputLink" name="link"
                                                                     class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                     placeholder="Link" required>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label for="linkDescription" class="col-sm-5 col-form-label"><b><g:message
                                                code="dashboard.description"></g:message></b></label>

                                        <div class="col-sm-7"><textarea id="linkDescription" name="linkdescription"
                                                                        class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                        placeholder="Description" required></textarea>
                                        </div>
                                    </div>

                                    <label for="inputTopic" class="col-sm-5 col-form-label"
                                           style="padding-left: initial"><b><g:message
                                            code="dashboard.link.topic"></g:message></b></label>

                                    <div class="col-sm-6 " style="display: inline-grid">
                                        <ls:showSubscribedTopics userId="${session.userId}"></ls:showSubscribedTopics>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="shareLink">Share Link</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:uploadForm></li>
            <li><button class="btn" data-toggle="modal" data-target="#exampleModalCenter2" style="line-height: 1"><i
                    class="fa fa-envelope nav-link"
                    style="color: white; font-size: 25px"></i>
                <b class="nav-link" style="color: white; font-size: 15px">SEND INVITE</b>
            </button>
                <g:form>
                    <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle2"><b>SEND INVITE</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="fieldcontain" style="margin-bottom: 3px;text-align: left">
                                        <g:textField name="address" id="address" placeholder="email@gmal.com"
                                                     required=""/>
                                    </div>

                                </div>

                                <div class="col">
                                    SELECT TOPIC : <ls:showSubscribedTopics
                                            userId="${session.userId}"></ls:showSubscribedTopics>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" id="topicInvite">Invite</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </g:form></li>
            <li>
                <div class="dropdown" style="display: inline-flex">
                    <button class="btn" style="color: white;font-size: 20px;display: inline-grid" type="button"
                            id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        <i class="fa fa-user nav-link" aria-hidden="true" style="color: white"></i>

                        <div class="nav-link"
                             style="font-size: 16px;position:relative;bottom: 4px;color: white"><b>@${session.userUserName}</b><i
                                class="fa fa-caret-down"
                                aria-hidden="true"></i></div>
                    </button>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item"
                           href="${createLink(controller: "profile", action: "show")}"><b>PROFILE</b></a>
                        <g:if test="${session.getAttribute("userIsAdmin")}">
                            <a class="dropdown-item"
                               href="${createLink(controller: "allUsers", action: "userDetails")}"><b>USERS</b></a>

                        </g:if>
                        <a class="dropdown-item"
                           href="${createLink(controller: "logout", action: "logout")}"><b>LOGOUT</b>
                        </a>
                    </div>
                </div>
            </li>
        </ul>

        <div class="ml-auto">
            <a href="javascript:void(0);" style="font-size:30px;color: white" class="icon nav-link"
               data-toggle="modal" data-target="#exampleModal3">&#9776;</a>
        </div>
        <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel3" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Link Sharing</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul>
                            <li>
                                Create Topic
                                <hr>
                            </li>
                            <li>
                                Share Doc
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <g:form url="[controller: 'topic', action: 'search']" class="navbar-right form-inline">
            <div class="input-group">
                <input class="form-control mr-sm-2 nav-link" type="search" placeholder="Search here" aria-label="Search"
                       name="searchText" id="searchText" autocomplete="off">

                <div class="input-group-btn">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="button">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </g:form>
    </div>
</nav>
<g:layoutBody/>

</body>
</html>
