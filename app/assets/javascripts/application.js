// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require jquery.slick
document.addEventListener('turbolinks:load', function () {
  $('.game_slider').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: ".nav_game_slider",
    infinite: false,
    arrows: false,
  });
  $('.nav_game_slider').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    focusOnSelect: true,
    arrows: true,
    asNavFor: ".game_slider",
    infinite: false,
    prevArrow: '<div class="prev"><i class="fas fa-chevron-left"></i></div>',
    nextArrow: '<div class="next"><i class="fas fa-chevron-right"></i></div>'
  });
})
