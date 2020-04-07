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
        <title>All topics</title>
    </head>
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
                <th class="th-sm">Name
                </th>
                <th class="th-sm">Owner
                </th>
                <th class="th-sm">Visibility
                </th>
                <th class="th-sm">Last Updated
                </th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${allTopics}" var="${topic}">
                <tr>
                    <td style="padding: 15px">${topic.id}</td>
                    <td style="padding: 15px">${topic.name}</td>
                    <td style="padding: 15px">${topic.createdBy.firstName}${" "+topic.createdBy.lastName}</td>
                    <td style="padding: 15px">${topic.visibility.name()}</td>
                    <td style="padding: 15px">${topic.lastUpdated}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#dtBasicExample').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>
</body>
</html>