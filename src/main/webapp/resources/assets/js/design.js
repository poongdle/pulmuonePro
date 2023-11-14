$(function(){
    $(".dropdown-toggle").on("click", function(){
        
        $(this).next().toggleClass("show")
    })

    $("html").on("click", function(e){
        if( !$(".dropdown").has(e.target).length ) {
            $(".site-link .dropdown-menu").removeClass("show");
        }
    })

    $(".btn-menu, .lnb-close").on("click", toggleMenu);
    function toggleMenu() {
        if ($("#lnb-item").css("display") == "block") {
          $("#lnb-item").slideUp();
        }
        else {
          $("#lnb-item").slideDown();
        }
    }


    $(document).on("click", "#pagable-list .card-header", function () {
        var card = $(this).parents(".card");
        if (card.hasClass("active")) {
          card.removeClass("active");
        } else {
          card.addClass("active");
        }
    });
})