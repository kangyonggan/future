$(function () {
    updateState("user/review");

    $(".markdown a").attr("target", "_blank");
    $(".markdown pre").addClass("prettyprint linenums");

    prettyPrint();
});