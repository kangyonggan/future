$(function () {
    $(".markdown a").attr("target", "_blank");
    $(".markdown pre").addClass("prettyprint linenums");
    $(".markdown table").addClass("table table-striped table-bordered table-hover");

    prettyPrint();

    var $form = $('#guestbook-form');
    var $btn = $("#submit");

    var timer;

    $form.validate({
        rules: {
            realname: {
                required: true,
                rangelength: [1, 32]
            },
            email: {
                required: true,
                rangelength: [1, 64]
            },
            content: {
                required: true,
                rangelength: [1, 2048]
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');
            $(form).ajaxSubmit({
                dataType: 'json',
                success: function (response) {
                    if (response.errCode == 'success') {
                        $("#resp-msg").html("留言成功，站长审核之后会发邮件通知您。");
                        $form.find("textarea").val("");
                        $form.find("input").val("");

                        timer = setInterval(function () {
                            clearInterval(timer);
                            $("#resp-msg").html("");
                        }, 3000)
                    } else {
                        $("#resp-msg").html(response.errMsg);

                        timer = setInterval(function () {
                            clearInterval(timer);
                            $("#resp-msg").html("");
                        }, 3000)
                    }
                    $btn.button('reset');
                },
                error: function () {
                    $("#resp-msg").html("服务器内部错误，请稍后再试。");
                    $btn.button('reset');

                    timer = setInterval(function () {
                        clearInterval(timer);
                        $("#resp-msg").html("");
                    }, 3000)
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


