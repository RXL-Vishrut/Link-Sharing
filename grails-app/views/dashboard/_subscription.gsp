<div class="card border-dark mb-6" style="width: 32rem; margin-bottom: 50px">
    <div class="card-header" style="background-color: #343a40;color: white">
        <span><b>Subscriptions</b></span>
        <span style="float:right"><b><a href="#"><u style="color: white">View All</u></a></b></span>
    </div>

    <div class="card-body text-dark overflow-auto" style="padding: 15px">
        <g:if test="${list}">
            <g:each in="${list}" var="${p}">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="background-color: #f1f1f1">
                        %{--                    <g:if test="${p.topic.createdBy}"--}%
                        <div class="row">
                            <div class="col-lg-3">
                                %{--                            <g:img dir="images" file="iamges.png"></g:img>--}%
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <g:link controller="showTopic"
                                                action="showtopic" params="[topicName:p.topic.name]"><b><u>${p.topic.name}</u>
                                        </b></g:link>
                                    </div>
                                </div>

                                <div class="row" style="font-size: 15px">
                                    <div class="col-lg-5"><b style="color: dimgrey">@${p.topic.createdBy.userName}</b>
                                    </div>

                                    <div class="col"><b>Subscriptions</b></div>

                                    <div class="col"><b>Posts</b></div>

                                    <div class="w-100"></div>

                                    <div class="col-lg-5"><g:link controller="dashboard" action="unsubscribe" params="[userId:p.user.id, topicId:p.topic.id]"><b><u>Unsubscribe</u></b></g:link></div>

                                    <div class="col-lg-4" style="text-align: center">50</div>

                                    <div class="col-lg-3" style="text-align: center">40</div>
                                </div>

                                <div class="row" style="margin-top: 4px">
                                    <div class="col">
                                        <g:select name="visibility" from="${enums.Visibility.values()}"></g:select>
                                    </div>

                                    <div class="col">
                                        <g:select name="seriousness" from="${enums.Seriousness.values()}"></g:select>
                                    </div>

                                    <div class="col">
                                        <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                                       style="color:black;position: relative; right: 10px;font-size: 15px;bottom: 3px"
                                                       ;></i></a>
                                        <a href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"
                                                       style="color:black; position: relative;font-size: 15px;bottom: 2px"
                                                       ;></i></a>
                                        <a href="#"><i class="fa fa-trash fa-lg" aria-hidden="true"
                                                       style="color:black; position: relative;left: 7px;font-size: 17px;bottom: 3px"
                                                       ;></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item" style="background-color: #f1f1f1;margin-bottom: 15px">
                        <div class="row">
                            <div class="col-lg-3">
                                %{--                            <g:img dir="images" file="iamges.png"></g:img>--}%
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <g:link controller="showTopic"
                                                action="showtopic" params="[topicName:p.topic.name]"><b><u>${p.topic.name}</u>
                                        </b></g:link>
                                    </div>
                                </div>

                                <div class="row" style="font-size: 15px">
                                    <div class="col-lg-5"><b style="color: dimgrey">@${p.topic.createdBy.userName}</b>
                                    </div>

                                    <div class="col"><b>Subscriptions</b></div>

                                    <div class="col"><b>Posts</b></div>

                                    <div class="w-100"></div>

                                    <div class="col-lg-5"><g:link controller="dashboard" action="unsubscribe" params="[userId:p.user.id, topicId:p.topic.id]"><b><u>Unsubscribe</u></b></g:link></div>

                                    <div class="col-lg-4" style="text-align: center">50</div>

                                    <div class="col-lg-3" style="text-align: center">40</div>
                                </div>

                                <div class="row" style="margin-top: 4px">
                                    <div class="col-lg-5">

                                    </div>

                                    <div class="col-lg-4">
                                        <g:select name="seriousness" from="${enums.Seriousness.values()}"></g:select>
                                    </div>

                                    <div class="col-g-1">
                                        <a href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"
                                                       style="color:black;position: relative; left: 50px;font-size: 15px;bottom: 3px"
                                                       ;></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
            </g:each>
        </g:if>
        <g:else><div class="alert-danger">No subscriptions yet..create topics first</div></g:else>
    </div>
</div>