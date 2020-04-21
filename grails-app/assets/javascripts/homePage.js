$(document).ready(function () {
    window.onscroll = function() {myFunction()};

    var navbar = document.getElementById("navbar");
    var sticky = navbar.offsetTop;

    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky")
        } else {
            navbar.classList.remove("sticky");
        }
    }
})

var forgotPassword = function(){
    $.ajax({
        url: "/login/forgotPassword/",
        type: "POST",
        data:{"emailForgot": $("#forgotEmail").val() },
        success: function () {
            $(".alert-success.forgot").html("Reset link sent")
        },
        error: function () {
            $(".alert-danger.forgot").html("Error occurred")
        }
    });
};
$(document).ready(function(){
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
    $(".btn").on("click",function () {
        $("#fm").fadeOut(1000)
    });
    $("#sendPassword").click(function () {
        var email = $("#forgotEmail").val()
        if(email) {
            var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
            if (testEmail.test(email)) {
                forgotPassword()
            }else{
                $(".alert-danger.forgot").html("Not a valid email address")
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        }else{
            $(".alert-danger.forgot").html("Enter an email address")
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });

    var myInput = document.getElementById("txtPassword");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
    myInput.onfocus = function () {
        document.getElementById("passwordMessage").style.display = "block";
    }

// When the user clicks outside of the password field, hide the message box
    myInput.onblur = function () {
        document.getElementById("passwordMessage").style.display = "none";
    }

// When the user starts to type something inside the password field
    myInput.onkeyup = function () {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if (myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if (myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if (myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if (myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }
});



