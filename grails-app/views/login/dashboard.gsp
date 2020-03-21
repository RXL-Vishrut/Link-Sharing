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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="dashboard.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand"><b>Link Sharing</b></a>
    <a href="#" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-link fa-lg" aria-hidden="true"
                                                                         style="color:white" ;></i>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><b>Create Topic(Pop up)</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        ...
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </a>
    <a href="#"><i class="fa fa-file-o fa-lg" aria-hidden="true"
                   style="color:white;position: relative;right:100px;"></i></a>
    <a href="#"><i class="fa fa-fw fa-user fa-lg" style="color:white;position: relative;right:200px;"></i></a>
    <a class="dropdown-toggle " data-toggle="dropdown" href="#"
       style="color:white;position: relative;right:300px;"><b>USER</b>
        <span class="caret"></span></a>
    <ul class="dropdown-menu" id="dropdown">
        <li><a href="#" style="color:black;position:relative;left:30px;">SETTINGS</a></li>
        <li><a href="#" style="color:black;position:relative;left:30px;">PROFILE</a></li>
        <li><a href="#" style="color:black;position:relative;left:30px;">SIGNOUT</a></li>
    </ul>

    <div class="col-sm-4">
        <form class="form-inline" style="position: relative;left: 80px;">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="button">Search</button>
        </form>
    </div>

</nav>

<div class="container" style="background-color: #f1f1f1">
    <div class="row">

        <div class="col-lg-5">

            <div class="card" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-body">
                    <h5 class="card-title"><b>Card title</b></h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p>${session.getAttribute("userdetails")}</p>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>

            <div class="card" style="width: 30rem; margin-bottom: 50px;">
                <div class="card-header">
                    <b>Subscriptions</b>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <div>
                            1.
                        </div>

                        <div>
                            <span class="col-lg-8" style="float: left;">
                                <span>
                                    <div class="btn-group">
                                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <b>enums.Visibility</b>
                                        </button>

                                        <div class="dropdown-menu">
                                            ...
                                        </div>
                                    </div>

                                    <div class="btn-group">
                                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <b>Privacy</b>
                                        </button>

                                        <div class="dropdown-menu">
                                            ...
                                        </div>
                                    </div>
                                </span>

                            </span>
                            <span class="col-lg-4" style="float: right; position: relative; top: 5px;">
                                <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                               style="color:black;position: relative; right: 10px;" ;></i></a>
                                <a href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"
                                               style="color:black; position: relative; left: 10px;top: 3px;" ;></i></a>
                                <a href="#"><i class="fa fa-trash fa-lg" aria-hidden="true"
                                               style="color:black; position: relative;left: 25px;" ;></i></a>
                            </span>
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
                                <div class="btn-group">
                                    <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                    style="margin-bottom: 5px">
                                        <b>Privacy</b>
                                    </button>

                                    <div class="dropdown-menu">
                                        ...
                                    </div>
                                </div>
                                <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                               style="color:black;position: relative; left: 30px;" ;></i></a>

                            </span>
                        </div>

                    </li>
                </ul>
            </div>

            <div class="card" style="width: 30rem;">
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


        <div class="col-lg-6" style="left: 50px;">
            <div class="card" style="width: 30rem;">
                <div class="card-header">
                    <b>Inbox</b>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Cras justo odio</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>

                </ul>
            </div>

        </div>
    </div>
</div>

</body>
</html>