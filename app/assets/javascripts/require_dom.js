//= require_tree ./resources
document.addEventListener('turbolinks:load', function () {
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

  $('a.social').click(function(e) {
    popupCenter($(this).attr('href'), $(this).attr('data-width'), $(this).attr('data-height'), 'authPopup');
    e.stopPropagation();
    return false;
  });
});
