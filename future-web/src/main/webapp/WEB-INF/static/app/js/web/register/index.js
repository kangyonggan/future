$(function () {
    var $form = $('#register-form');
    var $btn = $("#register");
    document.title = "注册";

    $("#reset").click(function () {
        $form.find("input").val("");
        return false;
    });

    $form.validate({
        rules: {
            username: {
                required: true,
                isMobile: true,
                remote: {
                    url: ctx + "/validate/user",
                    type: 'post',
                    data: {
                        'username': function () {
                            return $('#username').val()
                        }
                    }
                }
            },
            password: {
                required: true,
                isPassword: true
            },
            rePassword: {
                required: true,
                equalTo: "#password"
            },
            captcha: {
                required: true,
                isCaptcha: true
            }
        },
        submitHandler: function (form, event) {
            $btn.button('loading');
            $(form).ajaxSubmit({
                dataType: 'json',
                success: function (response) {
                    if (response.errCode == 'success') {
                        window.location.href = ctx + "#register/success?mobile=" + $('#username').val();
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
            return false;
        },
        errorPlacement: function (error, element) {
            error.appendTo(element.parent());
        },
        errorElement: "div",
        errorClass: "error"
    });

    var validCode = true;
    $("#sendSms").click(function () {
        var time = 60;
        var code = $(this);
        if (validCode) {
            validCode = false;
            code.attr("disabled", "true");

            $.post(ctx + "/sms/send", {
                mobile: $('#username').val(),
                type: "register"
            }, function (response) {
                if (response.errCode == "success") {
                    Message.error("短信发送失败");
                } else {
                    Message.success("短信发送成功");
                }
            }, "text");

            var t = setInterval(function () {
                time--;
                code.html(time + "秒");
                if (time == 0) {
                    clearInterval(t);
                    code.html("<i class='ace-icon fa fa-mobile bigger-130'></i>" + "重新获取");
                    validCode = true;
                    code.removeAttr("disabled");
                }
            }, 1000)
        }
    });
});

