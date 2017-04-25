

function loadDocument(){
    $('.viewmore').on(
        'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            var $collapse = $this.closest('.collapse-group').find('.collapse');
            $collapse.collapse('toggle');
            if($(this).text() == "View more..") {
                $(this).text("View less..."); }
            else { $(this).text("View more.."); }
        }
    );
    
    (function($) {
         fakewaffle.responsiveTabs(['xs', 'sm']);
    })(jQuery)
}


$(document).ready(loadDocument);