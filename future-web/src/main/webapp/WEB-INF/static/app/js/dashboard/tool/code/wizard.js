$(function () {
    updateState("tool/code");

    /**
     * 向导
     */
    $('#fuelux-wizard-container').ace_wizard().on('actionclicked.fu.wizard', function (e, info) {
        console.log("action");
    }).on('finished.fu.wizard', function (e) {
        console.log("finish");
    });

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
        if (this.checked) {
            $(".btnNameDisp").removeClass("hidden");
            $("#topBtnName").removeClass("hidden");
            $("#topBtnType").removeClass("hidden");
        } else {
            $(".btnNameDisp").addClass("hidden");
            $("#topBtnName").addClass("hidden");
            $("#topBtnType").addClass("hidden");
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
     * 初始化显示的列
     */
    var columns = [
        {disp: "ID", name: "id", sort: 0},
        {disp: "字段1", name: "column1", sort: 1},
        {disp: "字段2", name: "column2", sort: 2},
        {disp: "字段3", name: "column3", sort: 3},
        {disp: "字段4", name: "column4", sort: 4},
        {disp: "逻辑删除", name: "isDeleted", sort: 5},
        {disp: "创建时间", name: "createdTime", sort: 6},
        {disp: "更新时间", name: "updatedTime", sort: 7}
    ];

    /**
     * 重新加载显示的列
     */
    function reloadColumns() {
        $("#demo-table-body").empty();
        for (var i = 0; i < columns.length; i++) {
            $("#demo-table-body").append('<tr><td>' + columns[i].disp + '</td>' +
                '<td>' + columns[i].name + '</td> ' +
                '<td> <div class="hidden-sm hidden-xs btn-group"> <button class="btn btn-xs btn-warning"> ' +
                '<i class="ace-icon fa fa-pencil bigger-120"></i> </button> ' +
                '<button class="btn btn-xs btn-danger"> <i class="ace-icon fa fa-trash-o bigger-120"></i> </button> </div> </td> </tr>');
        }
    }

});