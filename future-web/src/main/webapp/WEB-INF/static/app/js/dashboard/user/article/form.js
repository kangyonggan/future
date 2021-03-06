$(function () {
    updateState("user/article");

    /**
     * 初始化markdown编辑器
     */
    $("#content").markdown({resize: 'vertical'});


    var $form = $('#article-form');
    var $btn = $("#submit");

    $form.validate({
        rules: {
            title: {
                required: true,
                rangelength: [1, 64]
            },
            categoryCode: {
                required: true,
                rangelength: [1, 16]
            },
            content: {
                required: true
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');
            $(form).ajaxSubmit({
                dataType: 'json',
                success: function (response) {
                    if (response.errCode == 'success') {
                        window.location.href = ctx + "/dashboard#user/article";
                    } else {
                        Message.error(response.errMsg);
                    }
                    $btn.button('reset');
                },
                error: function () {
                    Message.error("服务器内部错误，请稍后再试。");
                    $btn.button('reset');
                }
            });
        },
        errorPlacement: function (error, element) {
            error.appendTo(element.parent());
        },
        errorElement: "div",
        errorClass: "error"
    });
});