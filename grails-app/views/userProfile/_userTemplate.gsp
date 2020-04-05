<div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px;">

    <div class="card-body text-dark " style="padding: 12px;margin-right: 15px">
        <div class="row" style="background-color: #f1f1f1;margin-left: 1px">
            <div class="col-lg-4">
                <a href="${createLink(controller: "profile", action: "userProfile")}">
                    <img style="width: 100px;height: 110px;border-radius: 8px"
                         src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/></a>
            </div>

            <div class="col-lg-8">
                <div>
                    <p style="font-size: 25px; margin-bottom: 1px;padding: 5px"><b>${session.getAttribute("userFirstName")}  ${session.getAttribute("userLastName")}</b>
                        <b style="font-size: 15px;color: dimgrey;position: relative;bottom: 5px">~@${session.getAttribute("userUserName")}</b>
                    </p>
                </div>

                <div>
                    <div class="row">
                        <div class="col-lg-6">
                            <b style="color: dimgrey">Subscriptions</b>
                        </div>

                        <div class="col-lg-6">
                            <b style="color: dimgrey">Topics</b>
                        </div>

                        <div class="w-100">
                        </div>

                        <div class="col-lg-6" style="text-align: center;position:relative;right: 10px">
                            <b><ls:subscriptionCount userId="${session.userId}"></ls:subscriptionCount></b>
                        </div>

                        <div class="col-lg-6" style="text-align: center;position:relative;right: 40px">
                            <b><ls:topicCount userId="${session.userId}"></ls:topicCount></b>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
