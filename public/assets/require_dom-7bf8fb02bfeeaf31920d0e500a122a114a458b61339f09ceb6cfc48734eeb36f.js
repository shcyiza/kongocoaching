function toggleChevron(e){"use strict";$(e.target).prev(".panel-heading").find("i.indicator").toggleClass("icon_plus_alt2 icon_minus_alt2")}(function(){}).call(this),$(window).load(function(){"use strict";$('[data-loader="circle-side"]').fadeOut(),$("#preloader").delay(350).fadeOut("slow"),$("body").delay(350).css({overflow:"visible"}),$(window).scroll(),$(".number").each(function(){$(this).prop("Counter",0).animate({Counter:$(this).text()},{duration:2e3,easing:"swing",step:function(e){$(this).text(Math.ceil(e))}})})}),$(window).scroll(function(){"use strict";$(this).scrollTop()>1?$("header").addClass("sticky"):$("header").removeClass("sticky")}),(new WOW).init(),jQuery("#sidebar").theiaStickySidebar({additionalMarginTop:80}),jQuery(function(e){"use strict";function t(){e(this).css("display","block");var t=e(this).find(".modal-dialog"),i=(e(window).height()-t.height())/2,a=parseInt(t.css("marginBottom"),10);i<a&&(i=a),t.css("margin-top",i)}e(".modal").on("show.bs.modal",t),e(".modal-popup .close-link").click(function(t){t.preventDefault(),e(".modal").modal("hide")}),e(window).on("resize",function(){e(".modal:visible").each(t)})});var collapsefilters=$("#filters_col").find(".collapse");$(this).width()<991?(collapsefilters.removeClass("in"),collapsefilters.addClass("out")):(collapsefilters.removeClass("out"),collapsefilters.addClass("in")),$(".tooltip-1").tooltip({html:!0}),$(".panel-group").on("hidden.bs.collapse shown.bs.collapse",toggleChevron),$("#filter_buttons button").click(function(){$(this).toggleClass("active"),$(this).siblings().toggleClass("active",!1)}),$(function(){"use strict";function e(e){e.addEventListener("click",function(e){e.preventDefault(),!0===this.classList.contains("active")?this.classList.remove("active"):this.classList.add("active")})}$(".video").magnificPopup({type:"iframe"}),$(".parallax-window").parallax({}),$(".magnific-gallery").each(function(){$(this).magnificPopup({delegate:"a.magnific-picture",type:"image",tLoading:"Loading image #%curr%...",mainClass:"mfp-img-mobile",gallery:{enabled:!0,navigateByImgClick:!0,preload:[0,1]},image:{tError:'<a href="%url%">The image #%curr%</a> could not be loaded.',titleSrc:function(e){return e.el.attr("title")}}})});for(var t=document.querySelectorAll(".cmn-toggle-switch"),i=t.length-1;i>=0;i--){e(t[i])}$(window).scroll(function(){0!=$(this).scrollTop()?$("#toTop").fadeIn():$("#toTop").fadeOut()}),$("#toTop").on("click",function(){$("body,html").animate({scrollTop:0},500)})});var cat_nav=$("#cat_nav").find("li a");cat_nav.on("click",function(){"use strict";cat_nav.removeClass("active"),$(this).addClass("active")}),$(".carousel_testimonials").owlCarousel({items:1,loop:!0,autoplay:!1,animateIn:"flipInX",margin:30,stagePadding:30,smartSpeed:450,responsiveClass:!0,responsive:{600:{items:1},1e3:{items:1,nav:!1}}}),function(){$(".chosen-select").chosen({allow_single_deselect:!0,no_results_text:"No results matched",width:"100%"})}.call(this),document.addEventListener("turbolinks:load",function(){$("input").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",increaseArea:"20%"}),$(".popup-youtube, .popup-vimeo, .popup-gmaps").magnificPopup({disableOn:700,type:"iframe",mainClass:"mfp-fade",removalDelay:160,preloader:!1,fixedContentPos:!1}),$("a.social").click(function(e){return popupCenter($(this).attr("href"),$(this).attr("data-width"),$(this).attr("data-height"),"authPopup"),e.stopPropagation(),!1})});