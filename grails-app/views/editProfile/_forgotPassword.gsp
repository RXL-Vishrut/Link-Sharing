<div class="modal fade" id="my_modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="exampleModalLongTitle2"><b>Reset Password</b>

                    <div class="alert-success forgot">
                    </div>
                    <div class="alert-danger forgot">
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
%{--                    <g:textField name="forgotEmail"--}%
%{--                                 placeholder="email"--}%
%{--                                  id="forgotEmail"/>--}%
                    <input type="email" placeholder="Email" name="forgotEmail" id="forgotEmail">

                </div>
            </div>

            <div class="modal-footer">
                <button type="button"
                        class="btn-primary forgot" name="sendPassword" id="sendPassword">Send</button>
                <button type="button"
                        class="btn-secondary"
                        data-dismiss="modal" name="close">Close</button>
            </div>
        </div>
    </div>
</div>