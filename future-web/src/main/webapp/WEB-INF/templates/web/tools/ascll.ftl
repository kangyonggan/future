<#assign ctx="${(rca.contextPath)!''}">

<#assign toolTitle="ASCLL码对照表">
<#include "breadcrumbs.ftl">

<#list 0..3 as i>
<table class="table table-striped table-bordered table-hover ascll-table">
    <thead>
    <tr>
        <th>ASCLL值</th>
        <th>控制字符</th>
    </tr>
    </thead>

    <tbody>
        <#list (i * 32)..(i * 32 + 31) as j>
        <tr>
            <td>${asclls[j].code}</td>
            <td>${asclls[j].value}</td>
        </tr>
        </#list>
    </tbody>
</table>
</#list>