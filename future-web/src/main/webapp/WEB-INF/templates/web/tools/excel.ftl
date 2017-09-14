<#assign ctx="${(rca.contextPath)!''}">
<#assign data = RequestParameters.data!'' />

<#assign toolTitle="Excel自定义输出">
<#include "breadcrumbs.ftl">

<div>
    <form action="${ctx}/tools/excel" method="post" id="excel-fromat-form" class="tools-form"
          enctype="multipart/form-data">
        <div class="form-group">
            <label>自定义代码: &nbsp;<a href="#">查看例子</a></label>
            <textarea class="form-control" rows="10" id="data" name="data" placeholder="请输入自定义输出的代码，请参考例子"
                      required>${data}</textarea>
        </div>

        <div class="form-group">
            <label>上传Excel文件:</label>
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
    $("#excel-fromat-form").submit(function () {
        $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");

        var formData = new FormData();
        var data = $("#data").val();
        if (!data || data == '') {
            alert("请输入自定义代码");
            $btn.text("解析").removeAttr("disabled");
            return false;
        }
        formData.append("data", data);

        var filename = $(this).find("input[type='file']").val();
        if (!filename || filename == '') {
            alert("请选择一个excel文件");
            $btn.text("解析").removeAttr("disabled");
            return false;
        }
        formData.append("file", document.getElementById("file").files[0]);

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
</script>
