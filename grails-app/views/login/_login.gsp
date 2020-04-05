

    <div class="card border-dark mb-6 " style="max-width: 35rem;">
        <div class="card-header" style="background-color: #343a40;color: white"><b><g:message code="login.header.login"></g:message></b></div>

        <div class="card-body text-dark" style="padding-bottom: 0px;">

            <g:form action="login">

                <div class="row " style="margin-top: 20px; ">
                    <label for="username" class="col-sm-5 col-form-label"><b><g:message
                            code="login.email"></g:message></b></label>

                    <div class="col-sm-7"><input type="text" name="email" id="username"
                                                 class="form-control shadow p-3 mb-5 bg-white rounded"
                                                 placeholder="Enter Email" required>
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
                        <a href="#my_modal" data-toggle="modal"
                           >Forgot Password
                        </a>

                        <div class="modal fade" id="my_modal">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"
                                            id="exampleModalLongTitle2"><b>Find Your Account</b>

                                            <div class="alert-success forgot">
                                            </div>

                                        </h5>
                                        <button type="button" class="close"
                                                data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <div class="modal-body">
                                        <p>Please enter your email address</p>
                                        <div class="fieldcontain"
                                             style="width: 250px">
                                            <g:textField name="address"
                                                         placeholder="email@gmal.com"
                                                         required="" id="forgotAddress"/>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button"
                                                class="btn-primary forgot">Send</button>
                                        <button type="button"
                                                class="btn-secondary"
                                                data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-4"></div>

                    <div class="col-sm-3">
                        <button type="submit" class="btn" style="background-color: #343a40;color: white">Login</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
