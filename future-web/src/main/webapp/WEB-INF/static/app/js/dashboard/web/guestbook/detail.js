$(function () {
    updateState("web/guestbook");

    $(".markdown a").attr("target", "_blank");
    $(".markdown pre").addClass("prettyprint linenums");
    $(".markdown table").addClass("table table-striped table-bordered table-hover");

    prettyPrint();

    $(".page-header").on('click', 'a[data-role=guestbook-detail]', function () {
        var $trigger = $(this);
        var url = $trigger.data('url');
        var title = $trigger.attr("title");

        $.messager.confirm("提示", "确定" + title + "吗?", function () {
            $.get(url).success(function () {
                window.location.reload();
                Message.success("操作成功");
            }).error(function () {
                Message.error("网络错误，请稍后重试");
            })
        });
    });
});