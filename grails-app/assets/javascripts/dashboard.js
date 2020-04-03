
var create = function(){
    $.ajax({
        url: "/topic/create/",
        type: "POST",
        data:{"name": $("#inputTopicName").val() , "visibility": $("#visibility").val()},
        success: function (data) {
            if(data.success==true){
                alert("success")
            }else{
                alert("failed")
            }
        },
        error: function () {
            alert("Topic save failed")
        }

    });
};

$(document).ready(function () {
    $("#saveTopic").click(function () {
        create();
    });
});




var editTopic = function(topicName,topicId,visibility,seriousness){
    $.ajax({
        url: "/topic/editTopic/",
        type: "POST",
        data:{"topicName":topicName,"topicId":topicId, "visibility":visibility,"seriousness":seriousness },
        success: function (data) {
            if(data.success  ==  true){
                alert("Data changed")
            }else{
                alert("rating changed")
            }
        },
        error: function () {
            alert("Resource rating failed")
        }

    });
};


$(document).ready(function () {
    $(".subscriptionEdit").click(function () {
        $(this).parent().parent().siblings().eq(0).children(".col-lg-12").children(".hidden-field").attr('hidden',false)
        $(this).parent().parent().siblings().eq(0).children(".col-lg-12").children(".topic").attr('hidden',true)
        $(this).parent().siblings().eq(0).attr('hidden',false)
        $(this).parent().siblings().eq(1).attr('hidden',false)

    });
    $(".subscriptionSave").click(function () {
        var topicName = $(this).prev().prev().val();
        // var topicId = $(this).prev().text();
        // var visibility = $(this).parent().parent().parent().siblings(1).children().children();
        // var seriousness = $(this).parent().parent().parent().siblings(1).children().children().eq(1);
        // editTopic(topicName,topicId,visibility,seriousness)
    });
    $(".subscriptionCancel").click(function () {
        $(this).prev().prev().attr('hidden',true);
        $(this).parent().parent().parent().siblings().eq(1).children(".seriousness").attr('hidden',true);
        $(this).parent().parent().parent().siblings().eq(1).children(".visible").attr('hidden',true);
        $(this).parent().attr('hidden',true)
        $(this).parent().siblings().eq(0).attr('hidden',false)
    })
});





var read = function(){
    $.ajax({
        url: "/dashboard/isRead/",
        type: "POST",
        data:{"value": true },
        success: function (data) {
            if(data.success  ==  true){
                alert("success")
            }else{
                alert("rating changed")
            }
        },
        error: function () {
            alert("Resource rating failed")
        }

    });
};

$(document).ready(function () {
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
})





