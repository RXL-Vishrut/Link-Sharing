var rate = function(rating,resourceId){
    $.ajax({
        url: "/post/rating/",
        type: "POST",
        data:{"value": rating,"resourceId":resourceId },
        success: function (data) {
            if(data.success  ==  true){
                $(".alert-success").attr('hidden',false).html("Rating saved")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }else{
                $(".alert-success").attr('hidden',false).html("Rating updated")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            alert("Resource rating failed")
        }

    });
};
var editPost = function(description, resourceId){
    $.ajax({
        url: "/post/editPost/",
        type: "POST",
        data:{"description":description ,"resourceId":resourceId },
        success: function (data) {
            if(data.success  ==  true){
                $(".alert-success").attr('hidden',false).html("post edited")
                setTimeout(function(){
                    location.reload();
                }, 500);
            }else{
                $(".alert-danger").attr('hidden',false).html("post edited failed")
                setTimeout(function(){
                    location.reload();
                }, 500);
            }
        },
        error: function () {
            alert("Resource rating failed")
        }

    });
};


$(document).ready(function(){
    $(".editPost").click(function(){
        $(".postEdit").attr('hidden',false)
        // $(".postName").append($(".postDes").text())
        $(".postDes").attr('hidden',true)
    })
    $(".postCancel").click(function () {
        $(".postEdit").attr('hidden',true)
        $(".postDes").attr('hidden',false)

    })
    $(".postSave").click(function () {
        var description = $(".postName").val()
        var resourceId = $(this).attr('resourceId')
        editPost(description, resourceId)
    });
    $(function () {
        $("#rateYo").rateYo({
            starWidth: "25px",
            normalFill: "#A0A0A0",
            ratedFill: "#1e90ff",
            fullStar: true,
        });
        var rated = $("#rating").text()
        $("#rateYo").rateYo("option", "rating", rated);
        var $rateYo = $("#rateYo").rateYo();
        $("#rateYo").click(function () {
            console.log("hi")
            var rating = $rateYo.rateYo("rating");
            var resourceId = $("#res").text()
            console.log(rating)
            console.log(resourceId)
            rate(rating,resourceId)
        });
    });


});















