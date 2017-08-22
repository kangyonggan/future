<#assign ctx="${(rca.contextPath)!''}">
<#assign data = RequestParameters.data!'' />
<#assign dialect = RequestParameters.dialect!'' />

<div class="tool-title">SQL格式化</div>

<div>
    <h4>待格式化的SQL：</h4>
    <form action="#tools/sql" method="post" id="sql-fromat-form">
        <div class="form-group">
            <label>待格式化的sql：</label>
            <textarea class="form-control" rows="5" name="data" placeholder="请输入需要格式化的sql" required>${data}</textarea>
        </div>

        <div class="form-group">
            <label>选择方言：</label>
            <select name="dialect" class="form-control">
                <option value="MySQL" <#if dialect=='MySQL'>selected</#if>>MySQL</option>
                <option value="SQLServer" <#if dialect=='SQLServer'>selected</#if>>SQLServer</option>
                <option value="Oracle" <#if dialect=='Oracle'>selected</#if>>Oracle</option>
            </select>
        </div>

        <button class="btn btn-success mt-30" data-loading-text="正在格式化...">格式化</button>
    </form>
</div>

<div class="mt-30">
<#if result??>
    <pre class="result"><code>${result?html}</code></pre>
</#if>
</div>

<script>
    $("#sql-fromat-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });
</script>
