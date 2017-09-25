$(function () {
    updateState("tool/code");

    /**
     * 向导
     */
    $('#fuelux-wizard-container').ace_wizard().on('actionclicked.fu.wizard', function (e, info) {
        if (info.step == 1) {
            submitStep1();
        } else if (info.step == 2) {
            console.log(info);
            submitStep2();
        }
    }).on('finished.fu.wizard', function (e) {
        console.log("finish");
    });

    /**
     * 提交第一步的表单
     */
    function submitStep1() {
        var form = $("#step1-form")[0];
        $(form).ajaxSubmit({
            dataType: 'json',
            success: function (response) {
                if (response.errCode == 'success') {
                    Message.success("第一步的配置已暂存");
                } else {
                    Message.error(response.errMsg);
                }
            },
            error: function () {
                Message.error("服务器内部错误，请稍后再试。");
            }
        });
    }

    /**
     * 提交第二步的表单
     */
    function submitStep2() {
        var form = $("#step2-form")[0];
        $(form).ajaxSubmit({
            dataType: 'json',
            success: function (response) {
                if (response.errCode == 'success') {
                    Message.success("第二步的配置已暂存");
                } else {
                    Message.error(response.errMsg);
                }
            },
            error: function () {
                Message.error("服务器内部错误，请稍后再试。");
            }
        });
    }

    /**
     * 提示
     */
    $('[data-rel=popover]').popover({container: 'body'});

    /**
     * 设置界面名称
     */
    $("#pageName").change(function () {
        var pageName = $(this).val();

        if (pageName != '') {
            $(".pageNumDisp").html(pageName);
        } else {
            $(".pageNumDisp").html("界面名称");
        }
    });

    /**
     * 选择是否需要分页功能
     */
    $("#needPage").click(function () {
        if (this.checked) {
            $(".pageDisp").removeClass("hidden");
        } else {
            $(".pageDisp").addClass("hidden");
        }
    });

    /**
     * 设置添加按钮名称
     */
    $("#addBtnName").change(function () {
        var btnName = $(this).val();

        if (btnName != '') {
            $(".btnNameDisp").html(btnName);
        } else {
            $(".btnNameDisp").html("新增");
        }
    });

    /**
     * 多选框
     */
    $('.select2').css('min-width', '200px').select2({allowClear: true});

    /**
     * 删除表格的列
     */
    $('#columns').on("select2-removed", function (e) {
        var item = e.choice;
        for (var i = 0; i < columns.length; i++) {
            if (item.id == columns[i].field) {
                columns.splice(i, 1);
                break;
            }
        }

        reloadColumns();
    });

    /**
     * 添加表格的列
     */
    $('#columns').on("select2-selecting", function (e) {
        var item = e.choice;
        columns[columns.length] = {"field": item.id, "comment": item.text};

        reloadColumns();
    });

    /**
     * 重新加载表格的列
     */
    reloadColumns();

    function reloadColumns() {
        $("#columns-header").empty();
        for (var i = 0; i < columns.length; i++) {
            $("#columns-header").append('<th>' + columns[i].comment + '</th>');
        }
        $("#columns-header").append('<th>操作</th>');
    }

    /**
     * 删除表格的列
     */
    $('#searchColumns').on("select2-removed", function (e) {
        var item = e.choice;
        for (var i = 0; i < searchColumns.length; i++) {
            if (item.id == searchColumns[i].field) {
                searchColumns.splice(i, 1);
                break;
            }
        }

        reloadSearchColumns();
    });

    /**
     * 添加表格的列
     */
    $('#searchColumns').on("select2-selecting", function (e) {
        var item = e.choice;
        searchColumns[searchColumns.length] = {"field": item.id, "comment": item.text};

        reloadSearchColumns();
    });

    /**
     * 重新加载搜索的列
     */
    reloadSearchColumns();
    function reloadSearchColumns() {
        $("#search-form").empty();
        for (var i = 0; i < searchColumns.length; i++) {
            $("#search-form").append('<div class="form-group mt-4"><input type="text" class="form-control" name="' + searchColumns[i].field + '" placeholder="' + searchColumns[i].comment + '"/></div> ');
        }
        if (searchColumns.length > 0) {
            $("#search-form").append('<a href="javascript:" class="btn btn-sm btn-inverse mt-4">搜索<span class="ace-icon fa fa-search icon-on-right bigger-110"></span></a>');
        }
    }

    /**
     * 欲删除表单的列
     */
    $('#formColumns').on("select2-removing", function (e) {
        if (formColumns.length == 1) {
            e.preventDefault();
            Message.warning("至少留下一个字段");
        }
    });

    /**
     * 删除表单的列
     */
    $('#formColumns').on("select2-removed", function (e) {
        var item = e.choice;
        for (var i = 0; i < formColumns.length; i++) {
            if (item.id == formColumns[i].field) {
                formColumns.splice(i, 1);
                break;
            }
        }

        reloadFormColumns();
    });

    /**
     * 添加表单的列
     */
    $('#formColumns').on("select2-selecting", function (e) {
        var item = e.choice;
        formColumns[formColumns.length] = {"field": item.id, "comment": item.text};

        reloadFormColumns();
    });

    /**
     * 重新加载表单的列
     */
    reloadFormColumns();
    function reloadFormColumns() {
        $("#form-container").empty();
        for (var i = 0; i < formColumns.length; i++) {
            var column = formColumns[i];
            $("#form-container").append('<div class="form-group"> <label class="col-sm-3 control-label no-padding-right">' + column.comment + '</label> <div class="col-xs-12 col-sm-5"> <input type="text" class="form-control" name="' + column.field + '" placeholder="请输入' + column.comment + '"/> </div></div>');
        }
    }

    /**
     * 设置提交按钮名称
     */
    $("#submitBtnName").change(function () {
        var submitBtnName = $(this).val();

        if (submitBtnName != '') {
            $("#submitBtnNameDisp").html(submitBtnName);
        } else {
            $("#submitBtnNameDisp").html("提交");
        }
    });

});