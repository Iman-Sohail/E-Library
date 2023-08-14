/*!
* Start Bootstrap - Clean Blog v6.0.9 (https://startbootstrap.com/theme/clean-blog)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-clean-blog/blob/master/LICENSE)
*/
window.addEventListener('DOMContentLoaded', () => {
    let scrollPos = 0;
    const mainNav = document.getElementById('mainNav');
    const headerHeight = mainNav.clientHeight;
    window.addEventListener('scroll', function() {
        const currentTop = document.body.getBoundingClientRect().top * -1;
        if ( currentTop < scrollPos) {
            // Scrolling Up
            if (currentTop > 0 && mainNav.classList.contains('is-fixed')) {
                mainNav.classList.add('is-visible');
            } else {
                console.log(123);
                mainNav.classList.remove('is-visible', 'is-fixed');
            }
        } else {
            // Scrolling Down
            mainNav.classList.remove(['is-visible']);
            if (currentTop > headerHeight && !mainNav.classList.contains('is-fixed')) {
                mainNav.classList.add('is-fixed');
            }
        }
        scrollPos = currentTop;
    });
})

$(document).ready(function () {
    
    $(document).on('click', '#contactSubmitButton', function (e) {
        e.preventDefault();

        var name = $('#name').val();
        var email = $('#email').val();
        var phone = $('#phone').val();
        var message = $('#message').val();

        if (name == '') {
            alert('Please Enter Your Name');
            return false;
        }

        if (email == '') {
            alert('Please Enter Your Email');
            return false;
        }

        if (message == '') {
            alert('Please Enter Your Message ');
            return false;
        }

        var data = {
            'name_val': name,
            'email_val': email,
            'phone_val': phone,
            'message_val': message,
        };

        $('#big_loader').removeClass('d-none');
    
        $.ajax({
            url: '/contact_submit',
            type: 'POST',
            beforeSend: function (xhr) {
                var token = $('meta[name="csrf_token"]').attr('content');
    
                if (token) {
                    return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                }
            },
            data: data,
            success: function (response) {

                $('#big_loader').addClass('d-none');

                if (response == 'Form Submitted Successfully') {
                    $('#submitSuccessMessage').removeClass('d-none');
                    $('#submitErrorMessage').addClass('d-none');
                }

                $('#name').val('');
                $('#email').val('');
                $('#phone').val('');
                $('#message').val('');

            },
            error: function (result) {
                // console.log(result);
                // alert('some error');
                $('#big_loader').addClass('d-none');
                $('#submitErrorMessage').removeClass('d-none');
                $('#submitSuccessMessage').addClass('d-none');
                // Swal.fire({
                //     icon: 'error',
                //     text: 'Some Error'
                // })
            }
        });

    })

});