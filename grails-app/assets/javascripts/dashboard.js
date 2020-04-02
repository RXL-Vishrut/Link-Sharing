
var create = function(){
    $.ajax({
        url: "/dashboard/createTopic/",
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


// var create = function(){
//     $.ajax({
//         url: "/dashboard/createTopic/",
//         type: "POST",
//         data:{"name": $("#inputTopicName").val() , "visibility": $("#visibility").val()},
//         success: function (data) {
//             if(data.success==true){
//                 alert("success")
//             }else{
//                 alert("failed")
//             }
//         },
//         error: function () {
//             alert("Topic save failed")
//         }
//
//     });
// };
//
// $(document).ready(function () {
//     $("#visibility").click(function () {
//         create();
//     });
// });
$(document).ready(function () {
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
})





