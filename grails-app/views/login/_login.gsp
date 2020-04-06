<div class="card border-dark mb-6 " style="max-width: 35rem;">
    <div class="card-header" style="background-color: #343a40;color: white"><b><g:message
            code="login.header.login"></g:message></b></div>

    <div class="card-body text-dark" style="padding-bottom: 0px;">

        <g:form url='[controller:"login",action:"login"]'>

            <div class="row " style="margin-top: 20px; ">
                <label for="userName" class="col-sm-5 col-form-label"><b>Email/Username</b></label>

                <div class="col-sm-7">
                    <input type="text" placeholder="Username" name="userName" id="userName"
                           class="form-control shadow p-3 mb-5 bg-white rounded" required>
                </div>
            </div>

            <div class="row">
                <label for="password" class="col-sm-5 col-form-label"><b><g:message
                        code="login.password"></g:message></b></label>

                <div class="col-sm-7"><input type="password" name="password"
                                             id="password"
                                             class="form-control shadow p-3 mb-5 bg-white rounded"
                                             placeholder="Password" required>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    <a href="#my_modal" data-toggle="modal">Forgot Password
                    </a>
                    <g:render template="/editProfile/forgotPassword"></g:render>
                </div>


                <div class="col-4"></div>

                <div class="col-sm-3">
                    <button type="submit" class="btn" name="login"  style="background-color: #343a40;color: white">Login</button>
                </div>
            </div>
        </g:form>
    </div>
</div>
