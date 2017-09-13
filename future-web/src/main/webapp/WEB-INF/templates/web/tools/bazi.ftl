<#assign ctx="${(rca.contextPath)!''}">
<#assign lunar = RequestParameters.lunar!'1' />
<#assign year = RequestParameters.year!'' />
<#assign month = RequestParameters.month!'' />
<#assign day = RequestParameters.day!'' />
<#assign hour = RequestParameters.hour!'' />

<#assign toolTitle="八字、五行">
<#include "breadcrumbs.ftl">

<div>
    <h4>待推算的出生日期：</h4>
    <form action="#tools/bazi" method="post" id="bazi-form">
        <div class="form-group">
            <label>阴/阳历：</label>
            <select name="lunar" class="form-control" required>
                <option value="0" <#if lunar=='0'>selected</#if>>阴历</option>
                <option value="1" <#if lunar=='1'>selected</#if>>阳历</option>
            </select>
        </div>
        <div class="form-group">
            <label>出生年份：</label>
            <input type="number" class="form-control" name="year" value="${year}" placeholder="1991" max="2049" min="1900" required/>
        </div>
        <div class="form-group">
            <label>出生月份：</label>
            <input type="number" class="form-control" name="month" value="${month}" placeholder="12" max="12" min="1" required/>
        </div>
        <div class="form-group">
            <label>出生日期：</label>
            <input type="number" class="form-control" name="day" value="${day}" placeholder="27" max="31" min="1" required/>
        </div>
        <div class="form-group">
            <label>出生时辰：</label>
            <input type="number" class="form-control" name="hour" value="${hour}" placeholder="15" max="23" min="0" required/>
        </div>
        <button type="submit" class="btn btn-success" data-loading-text="正在推算...">推算</button>
    </form>
</div>

<div class="mt-30">
<#if result??>
    <pre class="result"><code>${result?html}</code></pre>
</#if>
</div>

<script>
    $("#bazi-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });
</script>

