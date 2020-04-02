var rate = function(){
    $.ajax({
        url: "/post/rating/",
        type: "POST",
        data:{"value": $("input[type='radio'][name='rating']:checked").val(),"resourceId":$(".res").text() },
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

$(document).ready(function(){
    $("#star1,#star2,#star3,#star4,#star5").click(function(){
        rate()
    });
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


$(document).ready(function(){
    $("#read").click(function(){
        read()
    });
});