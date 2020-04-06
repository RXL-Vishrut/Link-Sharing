var create = function () {
    $.ajax({
        url: "/topic/create/",
        type: "POST",
        data: {"name": $("#inputTopicName").val(), "visibility": $("#visibility").val()},
        success: function (data) {
            if (data.success == true) {
                $("#topicSuccess").html("Topic created successfully").attr('hidden', false)
            } else {
                $("#topicError").html("Error in saving topic").attr('hidden', false)
            }
        },
        error: function () {
            $("#topicError").html("Error in saving topic").attr('hidden', false)
        }

    });
};

$(document).ready(function () {
    $("#saveTopic").click(function () {
        create();
    });
});


var editTopic = function (topicName, topicId, visibility, seriousness) {
    $.ajax({
        url: "/topic/editTopic/",
        type: "POST",
        data: {"topicName": topicName, "topicId": topicId, "visibility": visibility, "seriousness": seriousness},
        success: function (data) {
            if (data.success == true) {
                alert("Data changed")
            } else {
                alert("topic edit error")
            }
        },
        error: function () {
            alert("Some error occurred")
        }

    });
};


$(document).ready(function () {
    $(".topicEdit").click(function () {
        var topicId = $(this).attr('topicId')
        console.log(topicId)
        $(this).parent().parent().siblings().eq(0).children(".col-lg-12").children(".hidden-field").attr('hidden', false)
        $(this).parent().parent().siblings().eq(0).children(".col-lg-12").children(".topic").attr('hidden', true)
        $(this).parent().siblings().eq(0).attr('hidden', false)
        $(this).parent().siblings().eq(1).attr('hidden', false)

    });
    $(".subscriptionSave").click(function () {
        var topicName = $(this).prev().prev().val();
        // var topicId = $(this).prev().text();
        // var visibility = $(this).parent().parent().parent().siblings(1).children().children();
        // var seriousness = $(this).parent().parent().parent().siblings(1).children().children().eq(1);
        // editTopic(topicName,topicId,visibility,seriousness)
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
        url: "/dashboard/invite/",
        type: "POST",
        data: {"address": $("#addressnull").val(), "subject": $("#subjectnull").val(), "body": $("#textnull").val()},
        success: function (/*data*/) {
            $(".alert-success").html("INVITE SENT")
        },
        error: function () {
            $(".alert-danger").html("SOME ERROR OCCURRED")

        }
    });
};

$(document).ready(function () {
    $('#my_modal').on('show.bs.modal', function (event) {
        var topicId = $(event.relatedTarget).data('topic-id');
        $(event.currentTarget).find('textarea[name="topicId"]').val(topicId);
    });
})

$(document).ready(function () {
    $("#invite").click(function () {
        invite();
    });
});


// <-------------------------------------------ISREAD---------------------------------------------------------->

// var read = function(){
//     $.ajax({
//         url: "/dashboard/isRead/",
//         type: "POST",
//         data:{"value": true , "resourceId": $(".resource").text()},
//         success: function (data) {
//             if(data.success  ==  true){
//                 alert("success")
//             }else{
//                 alert("rating changed")
//             }
//         },
//         error: function () {
//             alert("Resource rating failed")
//         }
//
//     });
// };
//
// $(document).ready(function () {
//     $(".readPost").click(function () {
//         read();
//     });
// });


// <-----------------------------------------TOPIC DELETE----------------------------------->

var deleteTopic = function (trashId) {
    $.ajax({
        url: "/topic/delete/",
        type: "POST",
        data: {"topicId": trashId},
        success: function (data) {
            if (data.success == true) {
                $("#trash").html("Topic deleted")
            } else {
                $("#trashdanger").html("Error in deleting topic")
            }
        },
        error: function () {
            $("#trashdanger").html("Error in deleting topic")
        }

    });
};


$(document).ready(function () {
    $(".delete").click(function () {
        var trashId = $(this).attr('trashId');
        deleteTopic(trashId)

    });
});

// <-----------------------------------------------------------------------------------------------------?

$(document).ready(function () {
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
})
