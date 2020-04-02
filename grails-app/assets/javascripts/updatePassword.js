$(document).ready(function () {
    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Password Matching').css('color', 'green');
        } else
            $('#message').html('Password Not Matching').css('color', 'red');
    });
})

$(document).ready(function(){
    $(".btn").on("click",function () {
        $("#fm").fadeOut(1000)
    });
});