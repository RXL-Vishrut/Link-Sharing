<div class="card border-dark mb-6 " style="max-width: 32rem;max-height: 4000px;left: 40px">
    <div class="card-header" style="background-color: #343a40;color: white"><b><g:message code="register.header.register"></g:message></b></div>

    <div class="card-body text-dark">

        <g:uploadForm url='[controller:"profile", action:"updateInfo"]'>

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
                <label for="username" class="col-sm-5 col-form-label"><b><g:message
                        code="register.username"></g:message></b></label>

                <div class="col-sm-7">
                    <input type="text" placeholder="Username" name="userName" id="username"
                           class="form-control shadow p-3 mb-5 bg-white rounded" required>
                </div>
            </div>

            <div class="row">
                <label for="customFile" class="col-sm-5 col-form-label"><b><g:message
                        code="register.photo"></g:message></b></label>

                <div class="custom-file mb-3 col-sm-7" style="overflow: hidden">
                    <input type="file" name="photo" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-8"><pre></pre></div>

                <div class="col-sm-4" >
                    <button type="submit" id="btnSubmit" class="btn" style="background-color: #343a40;color: white;position: relative;width: 150px;top: 15px">Update</button>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>