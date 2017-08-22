$(function () {
    $(".markdown a").attr("target", "_blank");
    $(".markdown pre").addClass("prettyprint linenums");
    $(".markdown table").addClass("table table-striped table-bordered table-hover");

    prettyPrint();

    if (key != '') {
        $("#main .search input").val(key);
    }


    var $title = $(".article-list .article .title a");

    $title.mouseover(function () {
        clearInterval(task);
        if ($line) {
            $line.addClass("line-hide").removeClass("line-show");
        }
        deg = 90;
        $line = $(this).parent("h2").find(".line");
        $line.css("width", $(this).width());
        $line.removeClass("line-hide").addClass("line-show");

        task = setInterval("mouseIn()", 10);
    });

    $title.mouseout(function () {
        clearInterval(task);
        task = setInterval("mouseOut()", 10);
    });
});


var $line, deg = 90, task;
function mouseIn() {
    deg += 5;
    if (deg >= 180) {
        clearInterval(task);
        deg = 180;
    }

    var y = $line[0];
    y.style.transform = "rotateY(" + deg + "deg)";
    y.style.webkitTransform = "rotateY(" + deg + "deg)";
    y.style.OTransform = "rotateY(" + deg + "deg)";
    y.style.MozTransform = "rotateY(" + deg + "deg)";

}

function mouseOut() {
    deg -= 5;
    if (deg <= 90) {
        clearInterval(task);
        $line.addClass("line-hide").removeClass("line-show");
        $line = null;
        return;
    }

    var y = $line[0];
    y.style.transform = "rotateY(" + deg + "deg)";
    y.style.webkitTransform = "rotateY(" + deg + "deg)";
    y.style.OTransform = "rotateY(" + deg + "deg)";
    y.style.MozTransform = "rotateY(" + deg + "deg)";
}