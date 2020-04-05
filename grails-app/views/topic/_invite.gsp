
<form url='[controller: "dashboard", action: "send", params: [topicId: topicId, userId: createdById]]'
      style="display: contents">
    <div class="modal fade" id="invite" tabindex="-1"
         role="dialog"
         aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered"
             role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"
                        id="exampleModalLongTitle2"><b>SEND INVITE</b>
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
                                     placeholder="email@gmal.com"
                                     required="" id="address${topicId}"/>
                    </div>
                    <div>${topicId}</div>
                    <div class="fieldcontain"
                         style="margin-bottom: 3px">
                        <g:textField name="subject"
                                     placeholder="Subject"
                                     required="" id="sub${topicId}"/>
                    </div>
                    <div class="fieldcontain"
                         style="margin-bottom: 3px">
                        <g:textArea name="body" rows="5"
                                    cols="50"
                                    placeholder="Your message"
                                    required="" id="body${topicId}"/>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit"
                            class="btn btn-primary">Invite</button>
                    <button type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</form>