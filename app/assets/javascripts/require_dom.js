/*here i've put all the js code that interract directly with the dom elements so the dom needs to be loaded to work
i've put at the end of the page for it to work more consistenly even with the code i haven't written has no page load event....*/
//= require_tree ./resources
document.addEventListener('turbolinks:load', () => {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green',
    increaseArea: '20%' // optional
  });


  $('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,

    fixedContentPos: false
  });

// trigger the popup for social loggin via the class social
  $('a.social').click(function(e) {
    popupCenter($(this).attr('href'), $(this).attr('data-width'), $(this).attr('data-height'), 'authPopup');
    e.stopPropagation();
    return false;
  });
});
