<#assign ctx="${(rca.contextPath)!''}">
<#assign type = RequestParameters.type!'0' />
<#assign data = RequestParameters.data!'' />

<#assign toolTitle="解析二维码">
<#include "breadcrumbs.ftl">

<div>
    <form action="${ctx}/tools/qr2" method="post" id="qr2-fromat-form" class="tools-form" enctype="multipart/form-data">
        <div class="form-group">
            <label><input type="radio" name="type" value="0" <#if type=="0">checked</#if>/> 图片URL:</label>
            <input class="form-control" id="data" name="data" placeholder="https://kangyonggan.com/upload/qr2.png" value="${data}"/>
        </div>

        <div class="form-group">
            <label><input type="radio" id="type-1" name="type" value="1" <#if type=="1">checked</#if>/> 上传图片:</label>
            <input type="file" id="file" name="file"/>
        </div>

        <button class="btn btn-success mt-30" data-loading-text="正在解析...">解析</button>
    </form>
</div>

<div class="mt-30">
    <div id="result" class="hidden">
        <h4>结果：</h4>
        <pre class="result"><code></code></pre>
    </div>
</div>

<script>
    function changeType(type) {
        if (type == "0") {
            $("#data").removeAttr("disabled");
            $("#file").attr("disabled", "disabled");
            $("#file").val("");
        } else {
            $("#data").attr("disabled", "disabled");
            $("#data").val("");
            $("#file").removeAttr("disabled");
        }
    }

    $("#qr2-fromat-form").submit(function () {
        $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");

        var formData = new FormData();
        if ($("input[name=type]:checked").val() == "0") {
            var data = $("#data").val();
            if (!data || data == '') {
                alert("请输入图片URL！");
                $btn.text("解析").removeAttr("disabled");
                return false;
            }
            formData.append("data", data);
        } else {
            var filename = $(this).find("input[type='file']").val();
            if (!filename || filename == '') {
                alert("请选择一张二维码图片");
                $btn.text("解析").removeAttr("disabled");
                return false;
            }
            formData.append("file", document.getElementById("file").files[0]);
        }

        $.ajax({
            url: $(this).attr("action"),
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                $("#result").removeClass("hidden").find("code").text(data);
                $btn.text("解析").removeAttr("disabled");
            },
            error: function () {
                $("#result").removeClass("hidden").find("code").text("网络错误，请稍后再试！");
                $btn.text("解析").removeAttr("disabled");
            }
        });

        return false;
    });

    changeType($("input[name=type]:checked").val());

    $("input[name=type]").click(function () {
        changeType($("input[name=type]:checked").val());
    });
</script>
