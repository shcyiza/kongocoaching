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
//= require trix
//= require cocoon
//= require chosen-jquery
//= require_tree ./app_default
//= require datepicker
//= require turbolinks


function animate( elementId, animation ) {
  var element = document.getElementById( elementId );
  element.classList.add( animation, "animated" );
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

function readURL(input, prev_el) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        prev_el.attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
  }
};

function triggerPrevieuw( input, prev_el ){
  prev_el.removeClass( "hidden" )
  readURL( input, prev_el );
};

function toggleSideBar() {
  const sidebar = document.querySelector('#sidebar-wrapper');
  const maincontent = document.querySelector('#main-wrapper');
  if (Array.from(sidebar.classList).includes('hidden')) {
    sidebar.classList.remove('hidden', 'fadeOutLeft');
    sidebar.classList.add('fadeInLeft');
    removeStyleTo( maincontent, 'col-md-12');
    maincontent.classList.add('col-md-10');
  } else {
    removeStyleTo( sidebar, "fadeInLeft" );
    addStyleTo( sidebar, "fadeOutLeft");
    maincontent.classList.remove( 'col-md-10' );
    addStyleTo( maincontent, 'col-md-12' );
    setTimeout( function(){
      sidebar.classList.add('hidden' );
    }, 1000 );
  }
};

function popupCenter(url, width, height, name) {
  var left = (screen.width/2)-(width/2);
  var top = (screen.height/2)-(height/2);
  return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
}

function addMultipleListener(element, eventNames, listener) {
  var events = eventNames.split(' ');
  for (var i=0, iLen=events.length; i<iLen; i++) {
    element.addEventListener(events[i], listener, false);
  }
}
