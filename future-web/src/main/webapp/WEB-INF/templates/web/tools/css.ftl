<#assign ctx="${(rca.contextPath)!''}">
<#assign data = RequestParameters.data!'' />

<#assign toolTitle="CSS压缩">
<#include "breadcrumbs.ftl">

<div>
    <h4>待压缩的CSS：</h4>
    <form action="#tools/css" method="post" id="css-fromat-form">
        <textarea class="form-control" rows="5" name="data" placeholder="请输入需要压缩的css" required>${data}</textarea>
        <button class="btn btn-success mt-30" data-loading-text="正在压缩...">压缩</button>
    </form>
</div>

<div class="mt-30">
<#if result??>
    <pre class="result"><code>${result?html}</code></pre>
</#if>
</div>

<script>
    $("#css-fromat-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });
</script>

