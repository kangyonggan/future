$(function () {
    updateState("book/manager");
    var $table = $('#book-table');

    $table.on('click', 'a[data-role=book-hot]', function () {
        var $trigger = $(this);
        var url = $trigger.data('url');
        var title = $trigger.attr("title");

        $.messager.confirm("提示", "确定" + title + "吗?", function () {
            $.get(url).success(function (html) {
                var $tr = $(html);
                $('#' + $tr.attr('id')).replaceWith($tr);
                Message.success("操作成功");
            }).error(function () {
                Message.error("网络错误，请稍后重试");
            })
        });
    });

    $table.on('click', 'a[data-role=book-update]', function () {
        var $trigger = $(this);
        var url = $trigger.data('url');
        var title = $trigger.attr("title");

        $.messager.confirm("提示", "确定" + title + "吗?", function () {
            $.get(url).success(function (data) {
                data = eval('(' + data + ')');

                if (data.errCode == "success") {
                    Message.success("后台正在抓取，请稍后刷新查看！");
                } else {
                    Message.warning(data.errMsg);
                }
            }).error(function () {
                Message.error("网络错误，请稍后重试");
            })
        });
    });

    $("#book-update").click(function () {
        var href = $(this).attr("href");
        $.messager.confirm("提示", "确定抓取小说吗?", function () {
            $.get(href).success(function (data) {
                data = eval('(' + data + ')');

                if (data.errCode == "success") {
                    Message.success("后台正在抓取，请稍后刷新查看！");
                } else {
                    Message.warning(data.errMsg);
                }
            }).error(function () {
                Message.error("网络错误，请稍后重试");
            })
        });

        return false;
    });
});