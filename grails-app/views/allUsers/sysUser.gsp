<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="allUsers.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
%{--        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--}%
%{--                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--}%
%{--                crossorigin="anonymous"></script>--}%
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/a81c0d9f01.js"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">

        <script type="text/javascript" charset="utf8"
                src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
        <script type="text/javascript"
                src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
        <title>Document</title>
    </head>
    <title>Users</title>
</head>

<body>

<div class="container">
    <div class="row" style="padding: 10px">
        <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%"
               style="margin: 10px">
            <thead>
            <tr>
                <th class="th-sm">Id
                </th>
                <th class="th-sm">UserName
                </th>
                <th class="th-sm">Email
                </th>
                <th class="th-sm">FirstName
                </th>
                <th class="th-sm">LastName
                </th>
                <th class="th-sm">isAdmin
                </th>
                <th class="th-sm">Active Status
                </th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${users}" var="user">
                <tr>
                    <td style="padding: 15px">${user.id}</td>
                    <td style="padding: 15px">${user.userName}</td>
                    <td style="padding: 15px">${user.email}</td>
                    <td style="padding: 15px">${user.firstName}</td>
                    <td style="padding: 15px">${user.lastName}</td>
                    <td style="padding: 15px" class="isAdmin" userId="${user.id}">
                        <div id="text" >
                            <g:if test="${user.admin}">
                                <a id="admin" style="cursor: pointer">Yes</a>
                            </g:if>
                        </div>
                        <div id="tex">
                            <g:if test="${!user.admin}">
                                <a id="notAdmin" style="cursor: pointer">No</a>
                            </g:if>
                        </div>

                    </td>
                    <td style="padding: 15px"><g:if test="${user.active}"><g:link controller="allUsers"
                                                                                  action="changeActiveStatus"
                                                                                  params="[userId: user.id]">Yes</g:link></g:if><g:if
                            test="${!user.active}"><g:link controller="allUsers" action="changeActiveStatus"
                                                           params="[userId: user.id]">No</g:link></g:if></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<script>


    var changeAdminStatus = function (userId) {
        $.ajax({
            url: "/allUsers/changeAdminStatus/",
            type: "POST",
            data: {"userId":userId},
            success: function (data) {
                if(data.success==true){
                    setTimeout(function(){
                        location.reload();
                    }, 500);
                }else{
                    setTimeout(function(){
                        location.reload();
                    }, 500);
                }
            },
            error: function () {

            }
        });
    };
    $(document).ready(function () {
        $('#dtBasicExample').DataTable();
        $('.dataTables_length').addClass('bs-select');

        $(".isAdmin").click(function () {
            var userId=$(this).attr("userId")
            console.log(userId)
            changeAdminStatus(userId)
        })
    });
</script>
</body>
</html>