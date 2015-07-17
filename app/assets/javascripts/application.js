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
//= require turbolinks
//= require best_in_place
//= require materialize-sprockets
//= require_tree .
$(document).ready(function() {
  // fadeInDisplay();
});

var $hamburger = $("#nav-burger");
var $root = $('html, body');

function animateHamburger() {
  $hamburger.toggleClass('open');
};
//
// function slideMenu() {
//   $("#menu-wrapper").toggleClass('open');
//   $("#menu-wrapper").one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd',
//   function(event) {
//     $("ul#menu li").toggleClass('trans-end');
//   });
// };

$hamburger.on('click', function(){
  // slideMenu();
  animateHamburger();
});
