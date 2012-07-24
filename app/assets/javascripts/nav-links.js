var NavLinks = {
Activate: function (linkId, linkGroup) {
    $(".nav-link").each(function (index) {
        console.log($(this).data('nav-link-group') + ":" + $(this).data('nav-link-id'));
        if ($(this).data('nav-link-group') == linkGroup) {
            $(this).removeClass('active');
            if ($(this).data('nav-link-id') == linkId) {
                $(this).addClass('active');
            }
        }
    });
}
}; 