$(document).ready(function () {
    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
});


var reset = function(){
    $.ajax({
        url: "/login/changePassword/",
        type: "POST",
        data:{"password": $("#txtConfirmPassword").val(),"userId": $(".password").text() },
        success: function (data) {
            if(data.success == true){
                console.log("inside")
                $(".alert-success.forgot").attr('hidden',false).html("Password Change")
            }else{
                console.log(data)
                $(".alert-danger.forgot").attr('hidden',false).html("Password cannot be saved")

            }
        },
        error: function () {
            alert("Password change failed")
        }
    });
};

$(document).ready(function () {
    $("#reset").click(function () {
        var password = $("#txtPassword").val()
        var cnfPassword = $("#txtConfirmPassword").val()
        if(password == cnfPassword){
            reset();
        }else{
            $(".alert-danger.forgot").attr('hidden',false).html("Password didn't matched")
        }
    });
});