<div class="modal" id="my_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="exampleModalLongTitle2"><b>SEND INVITE</b>

                    <div class="alert-success">
                    </div>
                    <div class="alert-danger"></div>

                </h5>
                <button type="button" class="close"
                        data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="fieldcontain"
                     style="margin-bottom: 3px">
                    <g:textField name="address"
                                 placeholder="email"
                                 required="" id="address${topicId}"/>
                </div>

                <div>${topicId}</div>

                <div class="fieldcontain"
                     style="margin-bottom: 3px">
                    <g:textField name="subject"
                                 placeholder="Subject"
                                 required="" id="subject${topicId}"/>
                </div>

                <div class="fieldcontain"
                     style="margin-bottom: 3px">
                    <g:textArea name="topicId" rows="5"
                                cols="50"
                                required="" id="text${topicId}"/>
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit"
                        class="btn btn-primary" name="invite" id="invite">Invite</button>
                <button type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>