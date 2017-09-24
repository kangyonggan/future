$(function () {
    updateState("tool/code");

    /**
     * 向导
     */
    $('#fuelux-wizard-container').ace_wizard().on('actionclicked.fu.wizard', function (e, info) {
        if (info.step == 1) {
            console.log("提交表单1");
            submitStep1();
        } else if (info.step == 2) {
            console.log("提交表单2");

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
     * 选择是否需要顶部按钮
     */
    $("#needAdd").click(function () {
        updateNeedAdd(this.checked);
    });

    // 初始化
    updateNeedAdd(needAdd);

    /**
     * 更新是否需要添加按钮
     *
     * @param needAdd
     */
    function updateNeedAdd(needAdd) {
        if (needAdd) {
            $(".btnNameDisp").removeClass("hidden");
            $("#topBtnName").removeClass("hidden");
            $("#topBtnType").removeClass("hidden");
        } else {
            $(".btnNameDisp").addClass("hidden");
            $("#topBtnName").addClass("hidden");
            $("#topBtnType").addClass("hidden");
        }

    }
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
     * 设置界面名称
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
            var index = columns[i].comment.indexOf(":");
            if (index != -1) {
                $("#columns-header").append('<th>' + columns[i].comment.substr(0, index) + '</th>');
            } else {
                $("#columns-header").append('<th>' + columns[i].comment + '</th>');
            }
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
            var index = searchColumns[i].comment.indexOf(":");
            if (index != -1) {
                $("#search-form").append('<div class="form-group mt-4"><input type="text" class="form-control" name="' + searchColumns[i].field + '" placeholder="' + searchColumns[i].comment.substr(0, index) + '"/></div> ');
            } else {
                $("#search-form").append('<div class="form-group mt-4"><input type="text" class="form-control" name="' + searchColumns[i].field + '" placeholder="' + searchColumns[i].comment + '"/></div> ');
            }
        }
        $("#search-form").append('<a href="javascript:" class="btn btn-sm btn-inverse mt-4">搜索<span class="ace-icon fa fa-search icon-on-right bigger-110"></span></a>');
    }

});