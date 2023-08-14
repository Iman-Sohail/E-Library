$(document).ready(function () {
    
    // Email Validation
    function IsEmail(email) {
        var regex =
        /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!regex.test(email)) {
            return false;
        } else {
            return true;
        }
    }
    $(document).on('click','#sub-btn-2',function(){

        var emailInputval = $('#sub-2').val();

        if (emailInputval == '') {
            alert("Email can't be empty")
            return false;
        }

        if ($("#sub-2").val().length) {
            if (IsEmail(emailInputval) == false) {
                alert("Please enter valid email and the try again");
                return false;
            }
        }

        var data = {
            'email_val': emailInputval,
        };

        $('#sub-loader').removeClass('d-none');

        $.ajax({
            url: '/subscribe-footer',
            type: 'POST',
            beforeSend: function (xhr) {
                var token = $('meta[name="csrf_token"]').attr('content');
                
                if (token) {
                    return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                }
            },
            data: data,
            success: function (response) {

                if (response == "subscribed") {
                    $('#sub-loader').addClass('d-none');
                    $('#sub-success-message').removeClass('d-none');
                    $('#sub-2').val('');
                }

            },
            error: function (result) {
                alert('some error');
                $('#sub-loader').addClass('d-none');
                return false;                
            }
        });
    });

    $(document).on('click','#register-user-btn',function(){

        var registerUserNameVal = $('#register-user-name').val();
        var registerUserEmailVal = $('#register-user-email').val();
        var registerUserPassVal = $('#register-user-pass').val();
        var registerUserPhoneVal = $('#register-user-phone').val();

        if (registerUserNameVal == '') {
            alert("Name can't be empty")
            return false;
        }
        if (registerUserEmailVal == '') {
            alert("Email can't be empty")
            return false;
        }
        if (registerUserPassVal == '') {
            alert("Pass can't be empty")
            return false;
        }

        if ($("#register-user-email").val().length) {
            if (IsEmail(registerUserEmailVal) == false) {
                alert("Please enter valid email and then try again");
                return false;
            }
        }

        var data = {
            'registerusername_val': registerUserNameVal,
            'registeruseremail_val': registerUserEmailVal,
            'registeruserpass_val': registerUserPassVal,
            'registeruserphone_val': registerUserPhoneVal,
        };

        $('#reg-loader').removeClass('d-none');

        $.ajax({
            url: '/registration',
            type: 'POST',
            beforeSend: function (xhr) {
                var token = $('meta[name="csrf_token"]').attr('content');
                
                if (token) {
                    return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                }
            },
            data: data,
            success: function (response) {

                if (response == "email registered") {
                    $('#reg-loader').addClass('d-none');
                    alert('Email Already Exists');
                }

                if (response == "registered") {
                    $('#reg-loader').addClass('d-none');
                    $('#reg-success-message').removeClass('d-none');

                    $('#register-user-name').val('');
                    $('#register-user-email').val('');
                    $('#register-user-pass').val('');
                    $('#register-user-phone').val('');
                }

            },
            error: function (result) {
                alert('some error');
                $('#reg-loader').addClass('d-none');
                return false;                
            }
        });

    });
    
    $(document).on('click','#login-user-btn',function(){
        
        var loginUserEmailVal = $('#login-user-email').val();
        var loginUserPassVal = $('#login-user-pass').val();
        
        if (loginUserEmailVal == '') {
            alert("Email can't be empty")
            return false;
        }
        if (loginUserPassVal == '') {
            alert("Pass can't be empty")
            return false;
        }

        if ($("#login-user-email").val().length) {
            if (IsEmail(loginUserEmailVal) == false) {
                alert("Please enter valid email and then try again");
                return false;
            }
        }
        
        var data = {
            'loginuseremail_val': loginUserEmailVal,
            'loginuserpass_val': loginUserPassVal,
        }

        $('#login-loader').removeClass('d-none');

        $.ajax({
            url: '/user_authenticate',
            type: 'POST',
            beforeSend: function (xhr) {
                var token = $('meta[name="csrf_token"]').attr('content');
                
                if (token) {
                    return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                }
            },
            data: data,
            success: function (response) {

                if (response == "wrong email") {
                    $('#login-loader').addClass('d-none');
                    alert('The Email your provided is not registered')
                }

                if (response == "wrong pass") {
                    $('#login-loader').addClass('d-none');
                    alert("The pass your provided doesn't match this email, please enter correct password and the try again")
                }

                if (response == "successfully loggedin") {
                    $('#login-loader').addClass('d-none');
                    $('#login-success-message').removeClass('d-none');

                    $('#login-user-email').val('');
                    $('#login-user-pass').val('');

                    window.location.href = "/";
                }

            },
            error: function (result) {
                alert('some error');
                $('#login-loader').addClass('d-none');
                return false;                
            }
        });

    });

});