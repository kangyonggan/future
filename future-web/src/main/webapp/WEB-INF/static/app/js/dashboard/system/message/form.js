$(function () {
    updateState("system/message");

    /**
     * 初始化markdown编辑器
     */
    $("#content").markdown({resize: 'vertical'});

    var $form = $('#message-form');
    var $btn = $("#submit");

    // 多选
    var select2 = $("#usernames");
    select2.css('width', '100%');
    select2.select2({
        allowClear: true
    });

    // 是否群发
    $("#message-form input[name='isGroup']").click(function () {
       if ("1" == $("#message-form input[name='isGroup']:checked").val()) {
           $("#select2-div").addClass("hidden");
       } else {
           $("#select2-div").removeClass("hidden");
       }
    });

    // 表单校验
    $form.validate({
        rules: {
            title: {
                required: true,
                rangelength: [1, 64]
            },
            type: {
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
                        window.location.href = ctx + "/dashboard#system/message";
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