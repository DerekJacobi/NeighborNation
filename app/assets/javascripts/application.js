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
console.log('jquery file required...');

function animateHamburger() {
  $("#nav-burger").toggleClass('open');
};

$("#nav-burger").on('click', function(){
  animateHamburger();
  slideMenu();
});
// Materialize swipe menu not working well...
// $(".button-collapse").sideNav();
// // Show sideNav
// $('.button-collapse').sideNav('show');
// // Hide sideNav
// $('.button-collapse').sideNav('hide');

function slideMenu() {
  console.log('slide menu starting');
  $("#menu-wrapper").toggleClass('open');
  console.log('slide menu ended');
  // $("#menu-wrapper").one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd',
  // function(event) {
  //   $("ul#menu li").toggleClass('trans-end');
  // });
};
