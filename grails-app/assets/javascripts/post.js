var rate = function(){
    $.ajax({
        url: "/post/rating/",
        type: "POST",
        data:{"value": $("input[type='radio'][name='rating']:checked").val(),"resourceId":$(".res").text() },
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

$(document).ready(function(){
    $("#star1,#star2,#star3,#star4,#star5").click(function(){
        rate()
    });
});

$(document).ready(function () {
    $(".editPost").click(function(){
        $(".postEdit").attr('hidden',false)
        // $(".postName").append($(".postDes").text())
        $(".postDes").attr('hidden',true)
    })
})

$(document).ready(function () {
    $(".postCancel").click(function () {
        $(".postEdit").attr('hidden',true)
        $(".postDes").attr('hidden',false)

    })
})

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

$(document).ready(function () {
    $(".postSave").click(function () {
        var description = $(".postName").val()
        var resourceId = $(this).attr('resourceId')
        editPost(description, resourceId)
    });
});













