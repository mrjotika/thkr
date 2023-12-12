const coutDown = (hour, minute, second) => {
    setInterval(
        (time = () => {
            var d = new Date();
            let hours = hour - 1 - d.getHours();
            let min = minute - d.getMinutes();
            if ((min + "").length == 1) {
                min = "0" + min;
            }
            let sec = second - d.getSeconds();
            if ((sec + "").length == 1) {
                sec = "0" + sec;
            }
            $("#the-24h-countdown p").html(
                "<span>" +
                hours +
                '</span><span class="min">' +
                min +
                '<br></span><span class="seg">' +
                sec +
                "</span>"
            );
        }),
        1000
    );
};
coutDown(24, 60, 60);
$(".navbar-with-more-menu__more").mouseenter(function() {
    $(".navbar-with-more-menu__more").addClass("show");
    $(".more-menu").addClass("open");
});

$(".navbar-with-more-menu__more").mouseleave(function() {
    $(".navbar-with-more-menu__more").removeClass("show");
    $(".more-menu").removeClass("open");
});
$(window).scroll(function() {
    let scroll = $(document).scrollTop();
    if (scroll >= 10) {
        $(".flash-sale-header-with-countdown-timer").addClass("ticky");
    } else {
        $(".flash-sale-header-with-countdown-timer").removeClass("ticky");
    }

    if (
        $(window).scrollTop() >
        $(".flash-sale-header-with-countdown-timer").outerHeight() +
        $(".flash-sale-banner").outerHeight() - 70
    ) {
        $(".inside-page__menu").addClass("sticky");
        $(".image-carousel__item-list").addClass("sticky");
    } else {
        $(".image-carousel__item-list").removeClass("sticky");
    }
});