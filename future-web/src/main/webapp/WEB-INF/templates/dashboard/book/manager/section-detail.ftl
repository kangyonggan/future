<#assign ctx="${(rca.contextPath)!''}">

<div class="center">
    <h1>${section.title}</h1>
</div>

<div class="space-32"></div>

<div class="section-content">
    ${section.content}
</div>

<div class="space-20"></div>

<div class="section-nav">
    <#if section.prevSectionCode gt 0>
        <div class="pull-left"><a href="#book/manager/${section.prevSectionCode}/section">←上一章</a></div>
    <#else>
        <div class="pull-left">没有上一章了</div>
    </#if>
    <#if section.nextSectionCode gt 0>
        <div class="pull-right"><a href="#book/manager/${section.nextSectionCode}/section">下一章→</a></div>
    <#else>
        <div class="pull-right">没有下一章了</div>
    </#if>
</div>

<script src="${ctx}/static/app/js/dashboard/book/manager/section-detail.js"></script>