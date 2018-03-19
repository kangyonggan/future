<#assign ctx="${(rca.contextPath)!''}">
<#assign firstName = RequestParameters.firstName!'' />
<#assign secondName = RequestParameters.secondName!'' />
<#assign sex = RequestParameters.sex!'' />
<#assign rand = RequestParameters.rand!'' />

<#assign toolTitle="在线起名">
<#include "breadcrumbs.ftl">

<div>
    <form action="#tools/name" method="post" id="name-form">
        <h4>请输入姓氏(必输)：</h4>
        <input class="form-control" name="firstName" placeholder="请输入姓氏" value="${firstName}" required/>
        <h4>请输入辈分(可选)：</h4>
        <input class="form-control" name="secondName" placeholder="请输入辈分" value="${secondName}"/>
        <h4>请选择性别(可选)：</h4>
        <select class="form-control" name="sec">
            <option value="">随便</option>
            <option value="0" <#if rand=="0">selected</#if>>男</option>
            <option value="1" <#if rand=="1">selected</#if>>女</option>
        </select>
        <h4>请选择随机因子(可选)：</h4>
        <select class="form-control" name="rand">
            <option value="">随便</option>
            <option value="animal" <#if rand=="animal">selected</#if>>动物</option>
            <option value="weather" <#if rand=="weather">selected</#if>>天气</option>
        </select>
        <button class="btn btn-success mt-30" data-loading-text="正在生成...">生成</button>
    </form>
</div>

<div class="mt-30 names">
    <#if names??>
        <#list names as name>
            <span>${firstName}${secondName}${name}</span>
        </#list>
    </#if>
</div>

<script>
    $("#name-form").submit(function () {
        var $btn = $(this).find("button");
        $btn.text($btn.attr("data-loading-text")).attr("disabled", "disabled");
    });
</script>
