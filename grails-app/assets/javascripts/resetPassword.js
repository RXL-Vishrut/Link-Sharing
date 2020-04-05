$(document).ready(function () {
    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
})


var change = function(){
    $.ajax({
        url: "/login/changePassword/",
        type: "POST",
        data:{"password": $("#txtConfirmPassword").val(),"userId": $(".password").text() },
        success: function (data) {
            if(data.success == true){
                $(".alert-success.forgot").attr('hidden',false).html("Password Change")
            }else{
                $(".alert-danger.forgot").attr('hidden',false).html("Password cannot be saved")

            }
        },
        error: function () {
            alert("Password change failed")
        }
    });
};

$(document).ready(function () {
    $(".btn-primary.reset").click(function () {
        change();
    });
});