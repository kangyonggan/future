<#assign ctx="${(rca.contextPath)!''}">
<#assign prov = RequestParameters.prov!'' />
<#assign startAge = RequestParameters.startAge!'1' />
<#assign endAge = RequestParameters.endAge!'100' />
<#assign sex = RequestParameters.sex!'' />
<#assign len = RequestParameters.len!'18' />
<#assign size = RequestParameters.size!'10' />

<#assign toolTitle="生成身份证">
<#include "breadcrumbs.ftl">

<div>
    <h4>生成条件：</h4>
    <form action="#tools/gencard" method="post" id="xml-fromat-form">

        <div class="form-group">
            <label>省份:</label>
            <select name="prov" class="form-control">
                <option value="">随机</option>
            <#list cityCodes?keys as key>
                <option value="${key}" <#if key==prov>selected</#if>>${cityCodes["${key}"]}</option>
            </#list>
            </select>
        </div>

        <div class="form-group">
            <label>年龄段(周岁):</label>
            <input type="number" class="form-control" name="startAge" value="${startAge}"/>
            至
            <input type="number" class="form-control" name="endAge" value="${endAge}"/>
        </div>

        <div class="form-group">
            <label>性别:</label>
            <select name="sex" class="form-control">
                <option value="-1">随机</option>
                <option value="0" <#if sex=="0">selected</#if>>男</option>
                <option value="1" <#if sex=="1">selected</#if>>女</option>
            </select>
        </div>

        <div class="form-group">
            <label>位数:</label>
            <select name="len" class="form-control">
                <option value="-1">随机</option>
                <option value="15" <#if len=="15">selected</#if>>15位</option>
                <option value="18" <#if len=="18">selected</#if>>18位</option>
            </select>
        </div>

        <div class="form-group">
            <label>生成数量（1~100）:</label>
            <input type="number" class="form-control" name="size" placeholder="生成数量" value="${size}" required/>
        </div>

        <button class="btn btn-success mt-30" data-loading-text="正在生成...">生成</button>
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
