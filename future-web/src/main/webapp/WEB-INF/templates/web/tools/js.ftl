<#assign ctx="${(rca.contextPath)!''}">
<#assign data = RequestParameters.data!'' />

<#assign toolTitle="JS压缩">
<#include "breadcrumbs.ftl">

<div>
    <h4>待压缩的JS：</h4>
    <form action="#tools/js" method="post" id="js-fromat-form">
        <textarea class="form-control" rows="5" name="data" placeholder="请输入需要压缩的js" required>${data}</textarea>
        <button class="btn btn-success mt-30" data-loading-text="正在压缩...">压缩</button>
    </form>
</div>

<#if resultMap??>
<div class="mt-30">
    <#if resultMap["result"]??>
        <h4>压缩结果：</h4>
        <pre class="result"><code>${resultMap["result"]?html}</code></pre>
    </#if>
</div>

<div class="mt-30">
    <#if resultMap["warningMsg"]??>
        <h4>警告：</h4>
        <pre class="result"><code>${resultMap["warningMsg"]?html}</code></pre>
    </#if>
</div>

<div class="mt-30">
    <#if resultMap["errorMsg"]??>
        <h4>错误：</h4>
        <pre class="result"><code>${resultMap["errorMsg"]?html}</code></pre>
    </#if>
</div>
</#if>

<script>
    $("#js-fromat-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });
</script>
