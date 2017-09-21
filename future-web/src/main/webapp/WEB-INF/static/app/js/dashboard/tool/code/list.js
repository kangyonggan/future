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
            $("#pageNumDisp").html(pageName);
        } else {
            $("#pageNumDisp").html("界面名称");
        }
    });

    /**
     * 选择是否需要顶部按钮
     */
    $("#needAdd").click(function () {
        if (this.checked) {
            $("#topBtnGroup").removeClass("hidden");
            $("#topBtnName").removeClass("hidden");
            $("#topBtnType").removeClass("hidden");
        } else {
            $("#topBtnGroup").addClass("hidden");
            $("#topBtnName").addClass("hidden");
            $("#topBtnType").addClass("hidden");
        }
    });

    /**
     * 选择是否需要分页功能
     */
    $("#needPage").click(function () {
        if (this.checked) {
            $("#pageDisp").removeClass("hidden");
        } else {
            $("#pageDisp").addClass("hidden");
        }
    });

    /**
     * 设置界面名称
     */
    $("#addBtnName").change(function () {
        var btnName = $(this).val();

        if (btnName != '') {
            $("#btnNameDisp").html(btnName);
        } else {
            $("#btnNameDisp").html("新增");
        }
    });


});