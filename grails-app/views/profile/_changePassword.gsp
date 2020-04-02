

<div class="card border-dark mb-6 " style="max-width: 32rem;margin-top: 50px;left: 40px">
    <div class="card-header" style="background-color: #343a40;color: white"><b><g:message code="change.password"></g:message></b></div>

    <div class="card-body text-dark" style="padding-bottom: 0px;">

        <g:form url='[controller:"profile", action:"changePassword"]'>

            <div class="row">
                <label for="txtPassword" class="col-sm-5 col-form-label"><b><g:message
                        code="login.password"></g:message></b></label>

                <div class="col-sm-7"><input type="password" name="password"
                                             id="txtPassword"
                                             class="form-control shadow p-3 mb-5 bg-white rounded"
                                             placeholder="Password" required>
                </div>
            </div>

                <div class="row">
                    <label for="txtConfirmPassword" class="col-sm-5 col-form-label"><b><g:message
                            code="register.confrimpassword"></g:message></b></label>

                    <div class="col-sm-7" style="text-align: right">
                        <input type="password" id="txtConfirmPassword" placeholder="Confirm Password"
                               name="confirmPassword" class="form-control shadow p-3 mb-5 bg-white rounded"
                               required>

                        <p class="registrationFormAlert" id="message" style="position:relative;right: 300px;font-size: 20px;bottom:30px"></p>
                    </div>
                </div>

            <div class="row">

                    <button type="submit" class="btn " style="background-color: #343a40;color: white;position:relative;width: 120px;left: 380px">Update</button>
            </div>
        </g:form>
    </div>
</div>
