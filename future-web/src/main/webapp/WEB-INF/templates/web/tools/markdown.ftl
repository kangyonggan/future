<#assign ctx="${(rca.contextPath)!''}">
<#assign data = RequestParameters.data!'' />
<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<#assign toolTitle="Markdown编辑器">
<#include "breadcrumbs.ftl">

<div>
    <h4>把markdown转成html：</h4>
    <form action="#tools/markdown" method="post" id="markdown-fromat-form">
        <textarea class="form-control" rows="5" name="data" placeholder="请输入需要转化的markdown" required>${data}</textarea>
        <button class="btn btn-success mt-30" data-loading-text="正在转化...">转成html</button>
    </form>
</div>

<div class="mt-30">
<#if result??>
    <h4>Html：</h4>
    <pre class="result"><code>${result?html}</code></pre>
</#if>
</div>

<div class="mt-30">
<#if result??>
    <h4>预览：</h4>
    <div class="markdown">
    ${result}
    </div>
</#if>
</div>

<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script>
    $("#markdown-fromat-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });

    $(".markdown a").attr("target", "_blank");
    $(".markdown pre").addClass("prettyprint linenums");
    $(".markdown table").addClass("table table-striped table-bordered table-hover");

    prettyPrint();
</script>
