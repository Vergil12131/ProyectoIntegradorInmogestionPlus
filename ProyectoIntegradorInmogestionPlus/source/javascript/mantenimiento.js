$(document).ready(function () {
    $(".user-nav").hover(
        function () {
            $(".pnlUser").show();
        },
        function () {
            $(".pnlUser").hide();
        }
    );
});