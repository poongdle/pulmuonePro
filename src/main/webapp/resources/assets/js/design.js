
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
})