$(function () {

    var $form = $('#modal-form');
    var $btn = $("#submit");
    var $modal = $form.parents('.modal');

    var file_input = $form.find('input[type=file]');
    file_input.ace_file_input({
        style: 'well',
        btn_choose: '点击这里添加mp3文件',
        btn_change: null,
        no_icon: 'ace-icon fa fa-music',
        droppable: false,
        allowExt: ["mp3"],
        allowMime: ["audio/mp3", "audio/mpeg"],
        maxSize: 104857600,//bytes
        thumbnail: 'fit'
    });

    file_input.on('file.error.ace', function(event, info) {
        if(info.error_count['size']) Message.warning('超出最大上传限制。');
        if(info.error_count['ext'] || info.error_count['mime']) Message.warning('不合法的文件类型。');
        event.preventDefault();
    });

    $form.validate({
        rules: {
            file: {
                required: true
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');
            $(form).ajaxSubmit({
                dataType: 'json',
                success: function (response) {
                    $btn.button('reset');
                    $modal.modal('hide');
                    if (response.errCode == 'success') {
                        Message.success("上传成功，等待管理员审核...");
                    } else {
                        Message.error(response.errMsg);
                    }
                },
                error: function () {
                    Message.error("服务器内部错误，请稍后再试。");
                    $btn.button('reset');
                    $modal.modal('hide');
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