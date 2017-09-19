$(function () {
    updateState("tool/template");

    var $form = $('#template-form');
    var $btn = $("#submit");

    // 表单校验
    $form.validate({
        rules: {
            dataSource: {
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
                        $form.addClass("hidden");
                        $("#template-name").html(response.template.name);
                        $("#template-type").html(response.template.type);
                        $("#template-username").html(response.template.username);
                        $("#template-result").html(response.result);
                        $("#generate-result").removeClass("hidden");

                        prettyPrint();
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