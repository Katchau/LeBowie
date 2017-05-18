$(document).ready(
    function() {
        $('[name=password]').css("pattern","^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    }
);