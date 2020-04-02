%{--<nav class="navbar navbar-dark bg-dark" style="height: 87px;margin-right: 55px;margin-right: 55px;border-radius: 8px">--}%
%{--    <div class="container-fluid">--}%

%{--        <div class="col-lg-3">--}%

%{--            <a class="navbar-brand"--}%
%{--               href="${createLink(controller: "dashboard", action: "subscribedTopics")}"><b>Link Sharing</b></a>--}%
%{--        </div>--}%

%{--        <div class="col-lg-5" style="max-width: fit-content;display: inline-flex;position: relative;left: 272px;top: 5px">--}%
%{--        --}%%{--            <-----------------------------NAVBAR USER---------------------------->--}%

%{--            <div class="dropdown" style="display: inline-flex">--}%
%{--                <button class="btn" style="color: white;font-size: 20px;display: inline-grid" type="button"--}%
%{--                        id="dropdownMenuButton"--}%
%{--                        data-toggle="dropdown" aria-haspopup="true"--}%
%{--                        aria-expanded="false">--}%
%{--                    <i class="fa fa-user" aria-hidden="true"></i>--}%

%{--                    <div>--}%
%{--                        <b style="font-size: 15px">USER</b><i class="fa fa-caret-down"--}%
%{--                                                              aria-hidden="true"></i>--}%
%{--                    </div>--}%
%{--                </button>--}%

%{--                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--}%
%{--                    <a class="dropdown-item"  href="${createLink(controller: "profile",action: "showProfile")}"><b>PROFILE</b></a>--}%
%{--                    <a class="dropdown-item" href="${createLink(controller: "logout", action: "logout")}"><b>LOGOUT</b>--}%
%{--                    </a>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--        </div>--}%


%{--        --}%%{--        <------------------------------------NAVBAR SEARCH------------------------------->--}%
%{--        <div class="col-lg-4" style="top: 8px">--}%
%{--            <form class="form-inline" style="justify-content: flex-end">--}%
%{--                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--}%
%{--                <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="button">Search</button>--}%
%{--            </form>--}%
%{--        </div>--}%

%{--    </div>--}%
%{--</nav>--}%


<%@ page import="mainapp.Topic; java.beans.Visibility" %>
<nav class="navbar navbar-dark bg-dark" style="margin-right: 55px;margin-right: 55px;border-radius: 8px">
    <div class="container-fluid">

        <div class="col-lg-3">
            <a class="navbar-brand"
               href="${createLink(controller: "dashboard", action: "show")}"><b>Link Sharing</b></a>

        </div>

        <div class="col-lg-5" style="max-width: fit-content;display: inline-flex">


        %{--            <-----------------------------NAVBAR USER---------------------------->--}%

            <div class="dropdown" style="display: inline-flex">
                <button class="btn" style="position:relative;left: 280px;color: white;font-size: 20px;display: inline-grid" type="button"
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
                    <a class="dropdown-item"  href="${createLink(controller: "profile",action: "showProfile")}"><b>PROFILE</b></a>
                    <g:if test="${session.getAttribute("userIsAdmin")}">
                        <a class="dropdown-item"  href="${createLink(controller: "logout",action: "logout")}"><b>TOPICS</b></a>
                        <a class="dropdown-item"  href="${createLink(controller: "post",action: "show")}"><b>POSTS</b></a>
                        <a class="dropdown-item"  href="${createLink(controller: "allUsers",action: "userDetails")}"><b>USERS</b></a>

                    </g:if>
                    <a class="dropdown-item"  href="${createLink(controller: "logout",action: "logout")}"><b>LOGOUT</b></a>
                </div>
            </div>

        </div>


        %{--        <------------------------------------NAVBAR SEARCH------------------------------->--}%
        <div class="col-lg-4" style="top: 8px" >
            <form class="form-inline" style="justify-content: flex-end;position:relative;">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="button">Search</button>
            </form>
        </div>

    </div>
</nav>