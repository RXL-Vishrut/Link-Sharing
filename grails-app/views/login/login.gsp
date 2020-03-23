<html>
<head>
    <title>

    </title>
    %{--        <meta name="layout" content="main"/>--}%
    <asset:stylesheet src="login/style.css"/>
    <asset:javascript src="login/mainApp.js"/>
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
</head>

<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand"><b>Link Sharing</b></a>

    <form class="form-inline">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>

<div class="container">
    <div class="row">
        <div class="col-lg-6">

            <div class="card border-dark mb-6 " style="max-width: 35rem;">
                <div class="card-header"><b><g:message code="login.recentshares"></g:message></b></div>

                <div class="card-body text-dark">
                    <h5 class="card-title">Dark card title</h5>

                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                </div>
            </div>


            <div class="card border-dark mb-6 " style="max-width: 35rem;max-height: 4000px;margin-top: 50px;">
                <div class="card-header"><b><g:message code="login.topposts"></g:message></b></div>

                <div class="card-body text-dark">
                    <h5 class="card-title">Dark card title</h5>

                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </div>

        </div>


        <div class="col-lg-1"></div>

        <div class="col-lg-5">

            <div class="card border-dark mb-6 " style="max-width: 35rem;">
                <div class="card-header"><b><g:message code="login.header.login"></g:message></b></div>

                <div class="card-body text-dark" style="padding-bottom: 0px;">

                    <g:form action="log">

                        <div class="row " style="margin-top: 20px; ">
                            <label for="txtemail" class="col-sm-5 col-form-label"><b><g:message
                                    code="login.email"></g:message></b></label>

                            <div class="col-sm-7"><input type="email" name="email" id="txtemail"
                                                         class="form-control shadow p-3 mb-5 bg-white rounded"
                                                         placeholder="Enter Email" required>
                            </div>
                        </div>

                        <div class="row">
                            <label for="txtPassword1" class="col-sm-5 col-form-label"><b><g:message
                                    code="login.password"></g:message></b></label>

                            <div class="col-sm-7"><input type="password" name="password"
                                                         id="txtPassword1"
                                                         class="form-control shadow p-3 mb-5 bg-white rounded"
                                                         placeholder="Password" required>
                            </div>
                        </div>

                        <div class="text-right" style="color: red">
                            <g:if test="${flash.error}">
                                ${flash.error}
                            </g:if>
                        </div>

                        <div class="row">
                            <div class="col-sm-5">
                                <g:link action="show" id="1">Forgot Password</g:link>
                            </div>

                            <div class="col-4"></div>

                            <div class="col-sm-3">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>


            <div class="card border-dark mb-6 " style="max-width: initial;max-height: 4000px;margin-top: 50px;">
                <div class="card-header"><b><g:message code="register.header.register"></g:message></b></div>

                <div class="card-body text-dark">

                    <g:uploadForm action="persist" enctype="multipart/form-data">

                        <div class="row" style="margin-top: 20px; ">
                            <label for="firstName" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.firstname"></g:message></b></label>

                            <div class="col-sm-7">
                                <input type="text" placeholder="Firstname" name="firstName" id="firstName"
                                       class="form-control shadow p-3 mb-5 bg-white rounded" required>
                            </div>
                        </div>

                        <div class="row">
                            <label for="lastName" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.lastname"></g:message></b></label>

                            <div class="col-sm-7">
                                <input type="text" placeholder="Lastname" name="lastName" id="lastName"
                                       class="form-control shadow p-3 mb-5 bg-white rounded" required>
                            </div>
                        </div>

                        <div class="row">
                            <label for="email" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.email"></g:message></b></label>

                            <div class="col-sm-7">
                                <input type="email" placeholder="Email" name="email" id="email"
                                       class="form-control shadow p-3 mb-5 bg-white rounded" required>
                            </div>
                            <g:if test="${flash.error1}">
                                <div class="message leftcolumn" style="color: red" role="alert">
                                    ${flash.error1}
                                </div>
                            </g:if>
                        </div>

                        <div class="row">
                            <label for="username" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.username"></g:message></b></label>

                            <div class="col-sm-7">
                                <input type="text" placeholder="Username" name="userName" id="username"
                                       class="form-control shadow p-3 mb-5 bg-white rounded" required>
                            </div>
                        </div>


                        <div class="row">
                            <label for="txtpassword" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.password"></g:message></b></label>

                            <div class="col-sm-7">
                                <input type="password" id="txtPassword" placeholder="Password" name="password"
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                       title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                                       class="form-control shadow p-3 mb-5 bg-white rounded" data-toggle="popover"
                                       data-target="#passwordMessage" required>
                            </div>
                        </div>

                        <div id="passwordMessage">

                            <p id="letter" class="invalid" style="margin: 0px">A <b>lowercase</b> letter</p>

                            <p id="capital" class="invalid" style="margin: 0px">A <b>capital (uppercase)</b> letter</p>

                            <p id="number" class="invalid" style="margin: 0px">A <b>number</b></p>

                            <p id="length" class="invalid" style="margin: 0px">Minimum <b>8 characters</b></p>
                        </div>

                        <div class="row">
                            <label for="txtConfirmPassword" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.confrimpassword"></g:message></b></label>

                            <div class="col-sm-7" style="text-align: right">
                                <input type="password" id="txtConfirmPassword" placeholder="Confirm Password"
                                       name="confirmPassword" class="form-control shadow p-3 mb-5 bg-white rounded"
                                       required>

                                <p class="registrationFormAlert" id="message"></p>
                            </div>
                        </div>

                        <div class="row">
                            <label for="customFile" class="col-sm-5 col-form-label"><b><g:message
                                    code="register.photo"></g:message></b></label>

                            <div class="custom-file mb-3 col-sm-7">
                                <input type="file" name="photo" class="custom-file-input" id="customFile">
                                <label class="custom-file-label" for="customFile">Choose file</label>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-8"><pre></pre></div>

                            <div class="col-sm-4">
                                <button type="submit" id="btnSubmit" class="btn btn-primary">Register</button>
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

                            $(document).ready(function () {
                                $('[data-toggle="popover"]').popover({container: ".popover", content: ""});
                            });

                        </script>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>