
$(document).ready(function() {

    
// Initialize All Tooltips
$(function () {
  $('[data-toggle="tooltip"]').tooltip({
      container: 'body'
  });
})

if ($(window).width() <= 768) {
// Toggle Tooltips Placement Responsively
    $('[data-toggle="tooltip"]').tooltip({ placement: 'top' });
// adjusting Landing Section Height
    $('#Hero').height('auto');
} else {
    $('[data-toggle="tooltip"]').tooltip({ placement: 'right' });
    $('#Hero').height($(window).height() - $('.navbar').height());
}

// Scroll to Sign Up Section
$("#GoToSignUp").click(function() {
    var offset = 0; //Offset of 20px

    $('html, body').animate({
        scrollTop: $("#SignUpSection").offset().top + offset
    }, 1000);
});

// Preview Image File Before Submit
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#ImagePreview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}
$("#ImageInput").change(function(){
    readURL(this);
});
    
// Debugging Footer Position
// check if body height is less than winow heigt
if ($('body').height() < $(window).height()) {
    $('body').height($(window).height());
    $('footer').css({
        position: 'absolute',
        bottom: 0 
    });
}

// Confirm Deleting a Post
$('.delete-post-button').click(function (e) {
    e.preventDefault(); // prevent "#" href event
    
    if (confirm($(this).attr('data-message')))
    {
        // do something        
    }
});
    
// Show/Hide Edit Post textarea
$('.edit-post-button').click(function (e) {
    e.preventDefault(); // prevent "#" href event
    
    $(this).nextAll('p').slideToggle();
    $(this).nextAll('.edit').slideToggle();
});
    
// Show/Hide Login/ForgotPass boxes
$('#forgotPassLink').click(function (e) {
    e.preventDefault(); // prevent "#" href event
    
    $("#loginForm").slideUp(300, function () {
        $("#forgotForm").slideDown();
    });
});
$('#loginLink').click(function (e) {
    e.preventDefault(); // prevent "#" href event
    
    $("#forgotForm").slideUp(300, function () {
        $("#loginForm").slideDown();
    });
});

// Auto Resizing all Textarea
$('textarea').each(function () {    
    $(this).autoResize({ maxHeight: '300px' });
});
    
});//document ready





