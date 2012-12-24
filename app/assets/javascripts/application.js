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

$(document).ready(function() {
    $('.edit_password').hide();
    $(".password_edit").click(function() {
        $(".edit_password").slideToggle("fast");
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

$(document).ready(function() {
    $('.edit_admin').hide();
    $(".admin_edit").click(function() {
        $(".edit_admin").slideToggle("fast");
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

$(document).ready(function() {
    $('.edit_credits').hide();
    $(".credits_edit").click(function() {
        $(".edit_credits").slideToggle("fast");
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


$(document).ready(function() {
    setTimeout( function(){
        $('.notice').fadeOut('slow');
    }, 3000);
});

function setSize() {
    var myWidth = 0, myHeight = 0;

    var objContentTab0 = document.getElementById('contentTab0');
    var objContentTab1 = document.getElementById('contentTab1');
    var objContentTab2 = document.getElementById('contentTab2');
    var objContentTab3 = document.getElementById('contentTab3');
    var objContentTab4 = document.getElementById('contentTab4');
    var objContentTab5 = document.getElementById('contentTab5');
    var objContentTab6 = document.getElementById('contentTab6');
    var objContentTab7 = document.getElementById('contentTab7');
    var objContentTab8 = document.getElementById('contentTab8');
    var objContentTab9 = document.getElementById('contentTab9');

    if (typeof (window.innerWidth) == 'number') {
        //Non-IE
        myWidth = document.documentElement.clientWidth;
        myHeight = window.innerHeight;
    }
    else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
        //IE 6+ in 'standards compliant mode'
        myWidth = document.documentElement.clientWidth;
        myHeight = document.documentElement.clientHeight;
    }
    else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
        //IE 4 compatible
        myWidth = document.body.clientWidth;
        myHeight = document.body.clientHeight;
    }

    objContentTab0.style.height = (myHeight - 57) + 'px';
    objContentTab1.style.height = (myHeight - 57) + 'px';
    objContentTab2.style.height = (myHeight - 57) + 'px';
    objContentTab3.style.height = (myHeight - 57) + 'px';
    objContentTab4.style.height = (myHeight - 57) + 'px';
    objContentTab5.style.height = (myHeight - 57) + 'px';
    objContentTab6.style.height = (myHeight - 57) + 'px';
    objContentTab7.style.height = (myHeight - 57) + 'px';
    objContentTab8.style.height = (myHeight - 57) + 'px';
    objContentTab9.style.height = (myHeight - 57) + 'px';
}

function selectionTab(value) {

    var objTab0 = document.getElementById('tab0');
    var objTab1 = document.getElementById('tab1');
    var objTab2 = document.getElementById('tab2');
    var objTab3 = document.getElementById('tab3');
    var objTab4 = document.getElementById('tab4');
    var objTab5 = document.getElementById('tab5');
    var objTab6 = document.getElementById('tab6');
    var objTab7 = document.getElementById('tab7');
    var objTab8 = document.getElementById('tab8');
    var objTab9 = document.getElementById('tab9');

    var objContentTab0 = document.getElementById('contentTab0');
    var objContentTab1 = document.getElementById('contentTab1');
    var objContentTab2 = document.getElementById('contentTab2');
    var objContentTab3 = document.getElementById('contentTab3');
    var objContentTab4 = document.getElementById('contentTab4');
    var objContentTab5 = document.getElementById('contentTab5');
    var objContentTab6 = document.getElementById('contentTab6');
    var objContentTab7 = document.getElementById('contentTab7');
    var objContentTab8 = document.getElementById('contentTab8');
    var objContentTab9 = document.getElementById('contentTab9');

    objTab0.style.borderBottom = '#A0C0E7 1px solid';
    objTab1.style.borderBottom = '#A0C0E7 1px solid';
    objTab2.style.borderBottom = '#A0C0E7 1px solid';
    objTab3.style.borderBottom = '#A0C0E7 1px solid';
    objTab4.style.borderBottom = '#A0C0E7 1px solid';
    objTab5.style.borderBottom = '#A0C0E7 1px solid';
    objTab6.style.borderBottom = '#A0C0E7 1px solid';
    objTab7.style.borderBottom = '#A0C0E7 1px solid';
    objTab8.style.borderBottom = '#A0C0E7 1px solid';
    objTab9.style.borderBottom = '#A0C0E7 1px solid';

    objContentTab0.style.display = 'none';
    objContentTab1.style.display = 'none';
    objContentTab2.style.display = 'none';
    objContentTab3.style.display = 'none';
    objContentTab4.style.display = 'none';
    objContentTab5.style.display = 'none';
    objContentTab6.style.display = 'none';
    objContentTab7.style.display = 'none';
    objContentTab8.style.display = 'none';
    objContentTab9.style.display = 'none';

    if (value == "0") {
        objTab0.style.background = '#DFEEFF';
        objTab0.style.borderBottom = '0px';
        objContentTab0.style.display = 'block';
    }
    else if (value == "1") {
        objTab1.style.background = '#DFEEFF';
        objTab1.style.borderBottom = '0px';
        objContentTab1.style.display = 'block';
    }
    else if (value == "2") {
        objTab2.style.background = '#DFEEFF';
        objTab2.style.borderBottom = '0px';
        objContentTab2.style.display = 'block';
    }
    else if (value == "3") {
        objTab3.style.background = '#DFEEFF';
        objTab3.style.borderBottom = '0px';
        objContentTab3.style.display = 'block';
    }
    else if (value == "4") {
        objTab4.style.background = '#DFEEFF';
        objTab4.style.borderBottom = '0px';
        objContentTab4.style.display = 'block';
    }
    else if (value == "5") {
        objTab5.style.background = '#DFEEFF';
        objTab5.style.borderBottom = '0px';
        objContentTab5.style.display = 'block';
    }
    else if (value == "6") {
        objTab6.style.background = '#DFEEFF';
        objTab6.style.borderBottom = '0px';
        objContentTab6.style.display = 'block';
    }
    else if (value == "7") {
        objTab7.style.background = '#DFEEFF';
        objTab7.style.borderBottom = '0px';
        objContentTab7.style.display = 'block';
    }
    else if (value == "8") {
        objTab8.style.background = '#DFEEFF';
        objTab8.style.borderBottom = '0px';
        objContentTab8.style.display = 'block';
    }
    else if (value == "9") {
        objTab9.style.background = '#DFEEFF';
        objTab9.style.borderBottom = '0px';
        objContentTab9.style.display = 'block';
    }
}

//A função é executada quando a página é carregada.
//Colocando a altura das tags divs.
//Selecionando a tab.
function pageLoad() {
    setSize();
    selectionTab('0');
}

window.onload = pageLoad;
window.onresize = setSize;