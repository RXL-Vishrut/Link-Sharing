<div class="card border-dark mb-6 " style="max-width: initial;max-height: 4000px;margin-top: 50px;">
    <div class="card-header" style="background-color: #343a40;color: white"><b><g:message code="register.header.register"></g:message></b></div>

    <div class="card-body text-dark">

        <g:uploadForm action="register" enctype="multipart/form-data">

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

                <div class="col-sm-4" >
                    <button type="submit" id="btnSubmit" class="btn" style="background-color: #343a40;color: white;position: relative;left: 20px;top: 15px">Register</button>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>