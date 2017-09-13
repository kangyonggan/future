<#assign ctx="${(rca.contextPath)!''}">
<#assign data = RequestParameters.data!'' />

<#assign toolTitle="XML格式化">
<#include "breadcrumbs.ftl">

<div>
    <h4>待格式化的XML：</h4>
    <form action="#tools/xml" method="post" id="xml-fromat-form">
        <textarea class="form-control" name="data" rows="5" placeholder="请输入需要格式化的xml" required>${data}</textarea>
        <button class="btn btn-success mt-30" data-loading-text="正在格式化...">格式化</button>
    </form>
</div>

<div class="mt-30">
<#if result??>
    <pre class="result"><code>${result?html}</code></pre>
</#if>
</div>

<script>
    $("#xml-fromat-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });
</script>
