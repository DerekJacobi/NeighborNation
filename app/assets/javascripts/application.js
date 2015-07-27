// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require materialize-sprockets
//= require_tree .
$(document).ready(function(){
    $('.modal-trigger').leanModal();
    $(".best_in_place").best_in_place();
    //************ Nav burger trigger ************//
    $("#nav-burger").on('click', function(){
      animateHamburger();
      slideMenu();
    });

    //************ Auto Scroll ************//
    var $root = $('html, body');

    $('#scroll-button').click(function() {
        $root.animate({
            scrollTop: $("#scroll-button").offset().top
        }, 250);
        return false;
    });

});

//************ Nav burger and menu ************//
function animateHamburger() {
  $("#nav-burger").toggleClass('open');
};

function slideMenu() {
  console.log('slide menu starting');
  $("#menu-wrapper").toggleClass('open');
  console.log('slide menu ended');
};


//************ Edit Suggestions menu ************//
// function suggestionMenu() {
//   $(".edit-menu").toggleClass('open');
// };
//
// $("#edit-gear").on('click', function(){
//   suggestionMenu();
// });
