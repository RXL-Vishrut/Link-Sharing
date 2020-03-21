$(".custom-file-input").on("change", function() {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
    alert("hello")

$(' #txtConfirmPassword').on('keyup', function () {
    if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
        $('#message').html('Matching').css('color', 'green');
    } else
        $('#message').html('Not Matching').css('color', 'red');
});


