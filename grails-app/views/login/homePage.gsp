<html>
<head>
    <title>

    </title>
    %{--        <meta name="layout" content="main"/>--}%
    <asset:stylesheet src="login/style.css"/>
    <asset:javascript src="homePage.js"></asset:javascript>
    <script src="https://use.fontawesome.com/a81c0d9f01.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
</head>

<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand"><b>Link Sharing</b></a>

    <form class="form-inline" style="margin-bottom: initial">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>

<g:if test="${flash.message}">
    <div id="fm" class="alert alert-success"
         style="display: block;text-align: center;margin-bottom: 38px">${flash.message}</div>
</g:if>


<div class="container">
    <div class="row">
        <div class="col-lg-6">

            <div class="card border-dark mb-6 " style="max-width: 35rem;">
                <div class="card-header" style="background-color: #343a40;color: white"><b><g:message
                        code="login.recentshares"></g:message></b></div>

                <div class="card-body text-dark">
                    <g:each in="${list}" var="p">
                        <div class="row">
                            <div class="col-lg-2">

                            </div>

                            <div class="col-lg-10">
                                <div class="row">
                                    <div class="col-lg-12" style="background-color: #f1f1f1">
                                        <div class="row" style="padding: 4px">
                                            <div class="col-lg-9" style="color: black">
                                                <b>${p.topic.createdBy.firstName + " "}${p.topic.createdBy.lastName + "  "}</b>

                                                <div style="font-size: 13px;font-weight: bold;display: inline;color: dimgrey">
                                                    -<g:formatDate format=" hh:mm dd MMMM yyyy"
                                                                   date="${p.lastUpdated}"/>
                                                </div>
                                            </div>

                                            <div class="col-lg-3" style="left: 30px;top: 5px">
                                                <b><u><a href="#" style="font-size: 12px">${p.topic.name}</a></u></b>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="w-100"></div>

                                    <div class="col-lg-12" style="margin-left: 2px">
                                        <p>${p.description}</p>
                                    </div>

                                    <div class="w-100"></div>

                                    <div class="col-lg-12" style="background-color: #f1f1f1;color: black">
                                        <div class="row" style="padding: 4px">
                                            <div class="col-lg-8">
                                                <a href="#"><i class="fa fa-facebook-f"
                                                               style="color: white;background-color:  #3b5998;margin-right: 10px;padding: 1px"></i>
                                                </a>
                                                <a href="#"><i class="fa fa-twitter" aria-hidden="true" style="margin-right: 10px"></i></a>
                                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"
                                                               style="color: red"></i></a>
                                            </div>

                                            <div class="col-lg-4" style="display: inline;left:60px;top: 5px">
                                                <a href="#" style="font-size:12px"><u><b>View Post</b></u></a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr style="margin-top: 3px;margin-right: -20px;margin-left: -20px;background-color: black">
                    </g:each>
                </div>
            </div>


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

                <div class="card-body text-dark">
                    <h5 class="card-title">Dark card title</h5>

                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });


    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });

    var myInput = document.getElementById("txtPassword");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

    // When the user clicks on the password field, show the message box
    myInput.onfocus = function () {
        document.getElementById("passwordMessage").style.display = "block";
    }

    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function () {
        document.getElementById("passwordMessage").style.display = "none";
    }

    // When the user starts to type something inside the password field
    myInput.onkeyup = function () {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if (myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if (myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if (myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if (myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }

    $(document).ready(function(){
        $(".btn").on("click",function () {
            $("#fm").fadeOut(1000)
        });
    });

</script>
</body>
</html>