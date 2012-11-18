// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
$('.edit_email').hide();
$('.edit_form').hide();
    $(".email_edit").click(function() {
			$(".edit_email").slideToggle("fast");
            if ($('.edit_form').is(":visible")){}
            else{
                $(".edit_form").slideToggle("fast");
            }
			/*if ($('.edit_name').is(":visible")){
				$('.edit_name').slideToggle("fast");
			}
            if ($('.edit_birthdate').is(":visible")){
                $('.edit_birthdate').slideToggle("fast");
            }
            if ($('.edit_sex').is(":visible")){
                $('.edit_sex').slideToggle("fast");
            }
            if ($('.edit_location').is(":visible")){
                $('.edit_location').slideToggle("fast");
            }*/
    });
});

$(document).ready(function() {
    $('.edit_name').hide();
    $(".name_edit").click(function() {
        $(".edit_name").slideToggle("fast");
        if ($('.edit_form').is(":visible")){}
        else{
            $(".edit_form").slideToggle("fast");
        }
        /*if ($('.edit_email').is(":visible")){
            $('.edit_email').slideToggle("fast");
        }
        if ($('.edit_birthdate').is(":visible")){
            $('.edit_birthdate').slideToggle("fast");
        }
        if ($('.edit_sex').is(":visible")){
            $('.edit_sex').slideToggle("fast");
        }
        if ($('.edit_location').is(":visible")){
            $('.edit_location').slideToggle("fast");
        }*/
    });
});

$(document).ready(function() {
    $('.edit_birthdate').hide();
    $(".birthdate_edit").click(function() {
        $(".edit_birthdate").slideToggle("fast");
        if ($('.edit_form').is(":visible")){}
        else{
            $(".edit_form").slideToggle("fast");
        }
        /*if ($('.edit_name').is(":visible")){
            $('.edit_name').slideToggle("fast");
        }
        if ($('.edit_email').is(":visible")){
            $('.edit_email').slideToggle("fast");
        }
        if ($('.edit_sex').is(":visible")){
            $('.edit_sex').slideToggle("fast");
        }
        if ($('.edit_location').is(":visible")){
            $('.edit_location').slideToggle("fast");
        }*/
    });
});

$(document).ready(function() {
    $('.edit_sex').hide();
    $(".sex_edit").click(function() {
        $(".edit_sex").slideToggle("fast");
        if ($('.edit_form').is(":visible")){}
        else{
            $(".edit_form").slideToggle("fast");
        }
        /*if ($('.edit_name').is(":visible")){
            $('.edit_name').slideToggle("fast");
        }
        if ($('.edit_birthdate').is(":visible")){
            $('.edit_birthdate').slideToggle("fast");
        }
        if ($('.edit_email').is(":visible")){
            $('.edit_email').slideToggle("fast");
        }
        if ($('.edit_location').is(":visible")){
            $('.edit_location').slideToggle("fast");
        }*/
    });
});

$(document).ready(function() {
    $('.edit_location').hide();
    $(".location_edit").click(function() {
        $(".edit_location").slideToggle("fast");
        if ($('.edit_form').is(":visible")){}
        else{
            $(".edit_form").slideToggle("fast");
        }
        /*if ($('.edit_name').is(":visible")){
            $('.edit_name').slideToggle("fast");
        }
        if ($('.edit_birthdate').is(":visible")){
            $('.edit_birthdate').slideToggle("fast");
        }
        if ($('.edit_sex').is(":visible")){
            $('.edit_sex').slideToggle("fast");
        }
        if ($('.edit_email').is(":visible")){
            $('.edit_email').slideToggle("fast");
        }*/
    });
});