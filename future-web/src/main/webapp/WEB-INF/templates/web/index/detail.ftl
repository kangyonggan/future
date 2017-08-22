<#assign ctx="${(rca.contextPath)!''}">
<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="detail">
    <div class="title">${article.title}</div>
    <div class="info">
        <span>来源：${article.username}</span>
        <span>栏目：<a href="#category/${article.categoryCode}">${article.categoryName}</a></span>
        <span>发布时间：<@c.relative_date datetime=article.createdTime/></span>
    </div>

    <div class="space-20"></div>
    <div class="space-20"></div>

    <div class="markdown">${article.content}</div>
</div>

<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/web/index/detail.js"></script>
