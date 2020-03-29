<%@ page import="MainApp.Topic; java.beans.Visibility" %>
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">

        <div class="col-lg-3">
%{--            <a class="navbar-brand"><b>Link Sharing</b></a>--}%

            <g:link class="navbar-brand" controller="dashboard" action="subscribedTopics"><b>Link Sharing</b></g:link>
        </div>

        <div class="col-lg-5" style="max-width: fit-content;display: inline-flex">

            %{--            <---------------------------------NAVBAR TOPIC---------------------------->--}%
            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter" style="line-height: 1"><i
                    class="fa fa-comment"
                    style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">CREATE TOPIC</b>
            </button>
            <g:uploadForm url='[controller: "dashboard", action: "createTopic"]'>
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
                                    <label for="inputName" class="col-sm-5 col-form-label"><b><g:message
                                            code="dashboard.topic.name"></g:message></b></label>

                                    <div class="col-sm-7"><input type="text" id="inputName" name="name"
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
                                <button type="submit" class="btn btn-primary">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </g:uploadForm>


        %{--            <------------------------------NAVBAR Doc----------------------------->--}%

            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter3" style="line-height: 1"><i
                    class="fa fa-file"
                    style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">SHARE DOCUMENT</b>
            </button>
            <g:uploadForm enctype="multipart/form-data" url='[controller: "dashboard", action: "shareDoc"]'>
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
                                        <label class="custom-file-label " for="customFile"></label>
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
                                    <g:select name="docTopic" from="${Topic.list().name}"
                                              id="inputTopic"/>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Share</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </g:uploadForm>



        %{--            <---------------------------------NAVBAR LINK----------------------------->--}%
            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter1" style="line-height: 1"><i
                    class="fa fa-link"
                    style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">SHARE LINK</b>
            </button>
            <g:uploadForm url='[controller: "dashboard", action: "shareLink"]'>
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
                                    <g:select name="linkTopic" from="${Topic.list().name}"
                                              id="inputTopic"/>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Share Link</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </g:uploadForm>



        %{--            <--------------------------NAVBAR INVITE------------------------------>--}%
            <button class="btn" data-toggle="modal" data-target="#exampleModalCenter2" style="line-height: 1"><i
                    class="fa fa-envelope"
                    style="color: white; font-size: 25px;display: block"></i>
                <b style="color: white; font-size: 15px">SEND INVITE</b>
            </button>
            <g:uploadForm url='[controller: "dashboard", action: "send"]'>
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
                                <div class="fieldcontain" style="margin-bottom: 3px">
                                    <g:textField name="address" placeholder="email@gmal.com" required="" />
                                </div>
                                <div class="fieldcontain" style="margin-bottom: 3px">
                                    <g:textField name="subject" placeholder="Subject" required="" />
                                </div>
                                <div class="fieldcontain" style="margin-bottom: 3px">
                                    <g:textArea name="body" rows="5" cols="50" placeholder="Your message" required="" />
                                </div>
                                <div>
                                    <input type="file" name="attachment" />
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Invite</button>
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
                    <a class="dropdown-item" href="#"><b>PROFILE</b></a>
                    <g:if test="${session.getAttribute("userIsAdmin")}">
                        <a class="dropdown-item" href="#"><b>USERS</b></a>
                        <a class="dropdown-item" href="#"><b>TOPIC</b></a>
                        <a class="dropdown-item" href="#"><b>POSTS</b></a>
                    </g:if>
                    <a class="dropdown-item" href="${createLink(controller: "logout",action: "logout")}"><b>LOGOUT</b></a>
                </div>
            </div>

        </div>


        %{--        <------------------------------------NAVBAR SEARCH------------------------------->--}%
        <div class="col-lg-4" style="top: 8px">
            <form class="form-inline" style="justify-content: flex-end">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="button">Search</button>
            </form>
        </div>

    </div>
</nav>