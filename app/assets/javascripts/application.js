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
//= require jquery
//= require jquery_ujs
//= require_tree ./app_default
//= require turbolinks



function animate( elementId, animation ) {
  var element = document.getElementById( elementId );
  element.classList.add("animated", animation );
};

function animateByElement( element, animation ) {
  element.classList.add("animated", animation );
};

function activateClass( elementId ) {
  var element = document.getElementById(elementId);
  element.classList.add("active");
};

function disActivateClass( elementId ) {
  var element = document.getElementById(elementId);
  element.classList.remove("active");
};

function activateClassByElement( element ) {
  element.classList.add("active");
};

function disActivateClassByElement( element ) {
  element.classList.remove("active");
};

function addStyleTo( el, styleClass ) {
  el.classList.add(styleClass);
};

function removeStyleTo( el, styleClass ) {
  el.classList.remove(styleClass);
};
