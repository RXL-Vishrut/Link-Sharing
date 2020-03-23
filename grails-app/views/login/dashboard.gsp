<!DOCTYPE html>
<html lang="en">
<head>
    <asset:stylesheet src="dashboard/dashboard.css"/>
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
    <title>Document</title>
</head>

<body>

<g:if test="${flash.message}">
    <div class="alert alert-success" style="display: block">${flash.message}</div>
</g:if>

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">

        <div class="col-lg-3">
            <a class="navbar-brand"><b>Link Sharing</b></a>

        </div>

        <div class="col-lg-5" style="max-width: fit-content;display: inline-flex">

            %{--            <---------------------------------NAVBAR TOPIC---------------------------->--}%
            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter" style="line-height: 1"><i class="fa fa-comment"
                                                                                         style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">CREATE TOPIC</b>
            </button>
            <g:uploadForm action="createTopic">
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle"><b>CREATE TOPIC</b></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="row " style="margin-top: 20px; ">
                                    <label for="inputLink" class="col-sm-5 col-form-label"><b><g:message
                                            code="dashboard.topic.name"></g:message></b></label>

                                    <div class="col-sm-7"><input type="text" id="inputLink" name="link"
                                                                 class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                 placeholder="Name" required>
                                    </div>
                                </div>


                                <label for="inputTopic" class="col-sm-5 col-form-label"
                                       style="padding-left: initial"><b><g:message
                                        code="dashboard.topic.visibility"></g:message></b></label>

                                <div class="col-sm-6" style="display: inline-block">
                                    <select class="form-control shadow p-1 mb-2 bg-white rounded" id="inputTopic">
                                        <option><b>PUBLIC</b></option>
                                        <option><b>PRIVATE</b></option>

                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </g:uploadForm>


%{--            <------------------------------NAVBAR RESOURCE----------------------------->--}%

            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter3" style="line-height: 1"><i class="fa fa-file"
                                                                                         style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">SHARE DOCUMENT</b>
            </button>
            <g:uploadForm action="shareDoc">
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
                                        <input type="file" name="document" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label " for="customFile" > </label>
                                    </div>
                                </div>

                                <div class="row">
                                    <label for="inputDescription" class="col-sm-5 col-form-label"><b><g:message
                                            code="dashboard.description"></g:message></b></label>

                                    <div class="col-sm-7"><textarea id="inputDescription" name="description"
                                                                    class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                    placeholder="Description" required></textarea>
                                    </div>
                                </div>

                                <label for="inputTopic" class="col-sm-5 col-form-label"
                                       style="padding-left: initial"><b><g:message
                                        code="dashboard.link.topic"></g:message></b></label>

                                <div class="col-sm-6" style="display: inline-block">
                                    <select class="form-control" id="inputTopic">
                                        <option><b>PUBLIC</b></option>
                                        <option><b>PRIVATE</b></option>

                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Share</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </g:uploadForm>



            %{--            <---------------------------------NAVBAR LINK----------------------------->--}%
            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter1" style="line-height: 1"><i class="fa fa-link"
                                                                                          style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">SHARE LINK</b>
            </button>
            <g:uploadForm action="shareLink">
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

                                    <div class="col-sm-7"><input type="text" id="inputLink" name="link"
                                                                 class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                 placeholder="Link" required></input>
                                    </div>
                                </div>

                                <div class="row">
                                    <label for="inputDescription" class="col-sm-5 col-form-label"><b><g:message
                                            code="dashboard.description"></g:message></b></label>

                                    <div class="col-sm-7"><textarea id="inputDescription" name="description"
                                                                    class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                    placeholder="Description" required></textarea>
                                    </div>
                                </div>

                                <label for="inputTopic" class="col-sm-5 col-form-label"
                                       style="padding-left: initial"><b><g:message
                                        code="dashboard.link.topic"></g:message></b></label>

                                <div class="col-sm-6" style="display: inline-block">
                                    <select class="form-control" id="inputTopic">
                                        <option><b>PUBLIC</b></option>
                                        <option><b>PRIVATE</b></option>

                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Share Link</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </g:uploadForm>



            %{--            <--------------------------NAVBAR INVITE------------------------------>--}%
            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter2" style="line-height: 1"><i class="fa fa-envelope"
                                                                                          style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">SEND INVITE</b>
            </button>
            <g:uploadForm action="sendInvite">
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
                                <div class="row " style="margin-top: 20px; ">
                                    <label for="inputEmail" class="col-sm-5 col-form-label"><b><g:message
                                            code="dashboard.invite.email"></g:message></b></label>

                                    <div class="col-sm-7"><input type="text" id="inputEmail" name="email"
                                                                 class="form-control shadow p-3 mb-5 bg-white rounded"
                                                                 placeholder="Name" required>
                                    </div>
                                </div>


                                <label for="inputTopic" class="col-sm-5 col-form-label"
                                       style="padding-left: initial"><b><g:message
                                        code="dashboard.link.topic"></g:message></b></label>

                                <div class="col-sm-6" style="display: inline-block">
                                    <select class="form-control shadow p-1 mb-2 bg-white rounded" id="inputTopic">
                                        <option><b>PUBLIC</b></option>
                                        <option><b>PRIVATE</b></option>

                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Invite</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </g:uploadForm>

            %{--            <-----------------------------NAVBAR USER---------------------------->--}%

            <div class="dropdown" style="display: inline-flex">
                <button class="btn" style="color: white;font-size: 20px;display: inline-grid" type="button"
                        id="dropdownMenuButton"
                        data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                    <i class="fa fa-user" aria-hidden="true"></i>

                    <div>
                        <b style="font-size: 15px">USER</b><i class="fa fa-caret-down"
                                                              aria-hidden="true"></i>
                    </div>
                </button>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#"><b>SETTINGS</b></a>
                    <a class="dropdown-item" href="#"><b>PROFILE</b></a>
                    <a class="dropdown-item" href="#"><b>LOG OUT</b></a>
                </div>
            </div>

        </div>


        %{--        <------------------------------------NAVBAR SEARCH------------------------------->--}%
        <div class="col-lg-4">
            <form class="form-inline" style="justify-content: flex-end">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="button">Search</button>
            </form>
        </div>

    </div>
</nav>


<div class="container" style="background-color: #f1f1f1">
    <div class="row">

        <div class="col-lg-5">

            <div class="card border-dark mb-6" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-body text-dark">
                    <div class="row">
                        <div class="col-lg-4">
                            <img style="width: inherit"
                                 src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/>
                        </div>

                        <div class="col-lg-8">
                            <div>
                                <p style="font-size: 25px; margin-bottom: 1px"><b>${session.getAttribute("userFirstName")}  ${session.getAttribute("userLastName")}</b>
                                </p>
                                <pre style="color: dimgrey"><b>@${session.getAttribute("userUserName")}</b></pre>
                            </div>

                            <div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <b style="color: dimgrey">Subscriptions</b>
                                    </div>

                                    <div class="col-lg-6">
                                        <b style="color: dimgrey">Topics</b>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            %{--            <-------------------------------------SUBSCRIPTIONS-------------------------------> --}%
            <div class="card border-dark mb-6" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-header">
                    <pre style="margin-bottom: 0px"><b
                            style="font-size: 17px">Subscriptions</b>                          <a
                            href="#"><u>View All</u></a></pre>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="padding-bottom: 0px">
                        <div class="row justify-content-center">
                            <div class="col"><pre style="margin-left: 35px"><a href="#"><u><b>Grails</b></u></a></pre>
                            </div>

                            <div class="w-100"></div>

                            <div class="col"><pre
                                    style="color:dimgrey ;margin-bottom: 0px;display: flex"><b>    @${session.getAttribute("userUserName")}</b>
                            </pre>


                                <div class="col">
                                    <pre style="margin-bottom: 0px"><a href="#"><u><b>Unsubscribe</b></u></a></pre>

                                </div>
                            </div>

                            <div class="col"><pre style="color:dimgrey;margin-bottom: 0px"><b>Subscriptions</b></pre>

                                <div><pre>2</pre></div>
                            </div>

                            <div class="col"><pre style="color:dimgrey;margin-bottom: 0px"><b>Post</b></pre>

                                <div><pre>3</pre></div>
                            </div>

                            <div class="w-100"></div>

                        </div>

                        <div>
                            <div class="col-lg-8" style="float: left">
                                <div class="form-group" style="float: left; width: 45%">

                                    <select class="form-control">
                                        <option><b>PUBLIC</b></option>
                                        <option><b>PRIVATE</b></option>

                                    </select>
                                </div>

                                <div class="form-group" style="float: right;width: 45%">

                                    <select class="form-control">
                                        <option><b>CASUAL</b></option>
                                        <option><b>SERIOUS</b></option>
                                        <option><b>VERY SERIOUS</b></option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-lg-4" style="float:right;">
                                <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                               style="color:black;position: relative; right: 10px;top: 8px" ;></i></a>
                                <a href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"
                                               style="color:black; position: relative; left: 10px;top: 10px;" ;></i></a>
                                <a href="#"><i class="fa fa-trash fa-lg" aria-hidden="true"
                                               style="color:black; position: relative;left: 25px;top: 8px" ;></i></a>
                            </div>

                        </div>

                    </li>
                    <li class="list-group-item">
                        <div>
                            2.
                        </div>

                        <div>
                            <span class="col-lg-6" style="float: left;">
                                <span>

                                </span>

                            </span>
                            <span class="col-lg-6" style="float: right; position: relative; top: 5px;">
                                <div class="form-group" style="float: left;width: 60%">

                                    <select class="form-control">
                                        <option><b>CASUAL</b></option>
                                        <option><b>SERIOUS</b></option>
                                        <option><b>VERY SERIOUS</b></option>
                                    </select>
                                </div>
                                <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                               style="color:black;position: relative; left: 30px;" ;></i></a>
                            </span>
                        </div>

                    </li>
                </ul>
            </div>

            <div class="card border-dark mb-6" style="width: 30rem;">
                <div class="card-header">
                    <b>Trending Topics</b>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Cras justo odio</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>

                </ul>
            </div>

        </div>


        <div class=col-lg-1>

        </div>

        %{--        <---------------------------------------TOP POSTS------------------------------------->--}%
        <div class="col-lg-6" style="left: 50px;">
            <div class="card border-dark mb-6" style="width: 30rem;">
                <div class="card-header">
                    <b>Inbox</b>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Cras justo odio</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>

                </ul>
            </div>

        </div>
    </div>
</div>
<script>
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

</script>
</body>
</html>