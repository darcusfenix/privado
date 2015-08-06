/* ---------------------------------------------
 Lightboxes
 --------------------------------------------- */

function init_lightbox() {

    // Works Item Lightbox
    $(".work-lightbox-link").magnificPopup({
        gallery: {
            enabled: true
        },
        mainClass: "mfp-fade"
    });

    // Works Item Lightbox
    $(".lightbox-gallery-1").magnificPopup({
        gallery: {
            enabled: true
        }
    });

    // Other Custom Lightbox
    $(".lightbox-gallery-2").magnificPopup({
        gallery: {
            enabled: true
        }
    });
    $(".lightbox-gallery-3").magnificPopup({
        gallery: {
            enabled: true
        }
    });
    $(".lightbox").magnificPopup();

}

function init_scroll_navigate() {

    $(".local-scroll").localScroll({
        target: "body",
        duration: 1500,
        offset: 0,
        easing: "easeInOutExpo"
    });

    var sections = $(".home-section, .split-section, .page-section");
    var menu_links = $(".scroll-nav li a");

    $(window).scroll(function () {

        sections.filter(":in-viewport:first").each(function () {
            var active_section = $(this);
            var active_link = $('.scroll-nav li a[href="#' + active_section.attr("id") + '"]');
            menu_links.removeClass("active");
            active_link.addClass("active");
        });

    });

}
