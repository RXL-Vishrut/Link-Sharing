var create = function () {
    $.ajax({
        url: "/topic/create/",
        type: "POST",
        data: {"name": $("#inputTopicName").val(), "visibility": $("#visibility").val()},
        success: function (data) {
            if (data.success == true) {
                $("#topicSuccess").html("Topic created successfully").attr('hidden', false)
                setTimeout(function(){
                    location.reload();
                }, 1000);
            } else {
                $("#topicError").html("Error in saving topic").attr('hidden', false)
                setTimeout(function(){
                    location.reload();
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            $("#topicError").html("Error in saving topic").attr('hidden', false)
            setTimeout(function(){
                location.reload();
                location.reload();
            }, 1000);
        }

    });
};

var editTopic = function (topicName, topicId, visibility, seriousness) {
    $.ajax({
        url: "/topic/editTopic/",
        type: "POST",
        data: {"topicName": topicName, "topicId": topicId, "visibility": visibility, "seriousness": seriousness},
        success: function (data) {
            if (data.success == true) {
                $("#trash").html("Topic edited successfully")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            } else {
                $("#trashdanger").html("Error in editing topic")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            $("#trashdanger").html("Error in editing topic")
            setTimeout(function(){
                location.reload();
            }, 1000);
        }

    });
};


$(document).ready(function () {
    $(".topicEdit").click(function () {
        $(this).parent().parent().siblings().eq(0).children(".col-lg-12").children(".hidden-field").attr('hidden', false)
        $(this).parent().parent().siblings().eq(0).children(".col-lg-12").children(".topic").attr('hidden', true)
        $(this).parent().siblings().eq(0).attr('hidden', false)
        $(this).parent().siblings().eq(1).attr('hidden', false)

    });
    $(".subscriptionSave").click(function () {
        var topicName = $(this).prev().prev().val();
        console.log(topicName)
        var topicId = $(this).prev().text();
        console.log(topicId)
        var visibility = $(this).parent().parent().parent().siblings(1).children(".visible").children("#visibility").val();
        console.log(visibility)
        var seriousness = $(this).parent().parent().parent().siblings(1).children(".seriousness").children("#seriousness").val();
        console.log(seriousness)
        editTopic(topicName,topicId,visibility,seriousness)
    });
    $(".subscriptionCancel").click(function () {
        $(this).prev().prev().attr('hidden', true);
        $(this).parent().parent().parent().siblings().eq(1).children(".seriousness").attr('hidden', true);
        $(this).parent().parent().parent().siblings().eq(1).children(".visible").attr('hidden', true);
        $(this).parent().attr('hidden', true)
        $(this).parent().siblings().eq(0).attr('hidden', false)
    })
});


// <-------------------------------------------Invite----------------------------->


var invite = function () {
    $.ajax({
        url: "/topic/invite/",
        type: "POST",
        data: {"address": $("#addressnull").val(), "subject": $("#subjectnull").val(), "body": $("#textnull").val()},
        success: function (/*data*/) {
            $(".alert-success").html("INVITE SENT")
            setTimeout(function(){
                location.reload();
            }, 1000);
        },
        error: function () {
            $(".alert-danger").html("SOME ERROR OCCURRED")
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};

// <-------------------------------------------ISREAD---------------------------------------------------------->

var markAsReadPost=function (resourceId) {
    $.ajax({
        url:"/topic/isRead",
        type:"POST",
        data:{"resourceId":resourceId},
        success:function(data){
            if(data.success==true){
                //$('#info').html("Your Choice has been Locked").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
            else{
                //$('#info').html("Sorry your choice has not been locked").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
    });
};
// <-----------------------------------------TOPIC DELETE----------------------------------->

var deleteTopic = function (trashId) {
    $.ajax({
        url: "/topic/delete/",
        type: "POST",
        data: {"topicId": trashId},
        success: function (data) {
            if (data.success == true) {
                $("#trash").html("Topic deleted")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            } else {
                $("#trashdanger").html("Error in deleting topic")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            $("#trashdanger").html("Error in deleting topic")
            setTimeout(function(){
                location.reload();
            }, 1000);
        }

    });
};

// <-----------------------------Subscribed topic seriousness------------------------>>

var SubscribedTopicSeriousness = function (topicId,seriousness) {
    $.ajax({
        url: "/topic/subTopicSeriousness/",
        type: "POST",
        data: {"topicId": topicId, "seriousness":seriousness},
        success: function (data) {
            if (data.success == true) {
                $("#trash").html("Topic seriousness changed")
                setTimeout(function(){
                    location.reload();
                }, 2000);
            } else {
                $("#trashdanger").html("Error in changing topic's seriousness")
                setTimeout(function(){
                    location.reload();
                }, 2000);
            }
        },
        error: function () {
            $("#trashdanger").html("Error in changing topic seriousness!!")
            setTimeout(function(){
                location.reload();
            }, 1000);
        }

    });
};

$(document).ready(function(){
    $(".subSeriousness").click(function () {
        var topicId = $(this).attr("topicId")
        var seriousness = $(this).val()
        SubscribedTopicSeriousness(topicId, seriousness)
    });

    $(".delete").click(function () {
        var trashId = $(this).attr('trashId');
        deleteTopic(trashId)
    });

    $(".readPost").click(function () {
        var resourceId = $(this).attr('resourceId')
        markAsReadPost(resourceId);
    });

    $("#invite").click(function () {
        invite();
    });

    $('#my_modal').on('show.bs.modal', function (event) {
        var topicId = $(event.relatedTarget).data('topic-id');
        $(event.currentTarget).find('textarea[name="topicId"]').val(topicId);
    });

    $("#saveTopic").click(function () {
        create();
    });

    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

})
