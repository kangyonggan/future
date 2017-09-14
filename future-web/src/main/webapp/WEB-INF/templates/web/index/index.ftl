<#assign ctx="${(rca.contextPath)!''}">
<#assign key = RequestParameters.key!'' />

<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="navigation">
    当前位置：&nbsp;
    <#if type="index">
        <a href="javascript:" class="active">首页</a>
    <#elseif type="search">
        <a href="#index">首页</a>
        &nbsp;>&nbsp;
        <a href="javascript:" class="active">搜索结果(共找到${page.total}条记录)</a>
    <#else>
        <a href="#index">首页</a>
        &nbsp;>&nbsp;
        <a href="javascript:" class="active">${category.name}</a>
    </#if>
</div>
<div class="navigation-line"></div>

<#if page.list?size gt 0>
<ul class="article-list">
    <#list page.list as article>
        <li class="article">
            <h2 class="title">
                <a href="#article/${article.id}">${article.title}</a>
                <div class="line line-hide"></div>
            </h2>
            ${article_has_next}
            <div class="info">
                <span>来源：${article.username}</span>
                <span>栏目：<a href="#category/${article.categoryCode}">${article.categoryName}</a></span>
                <span>发布时间：<@c.relative_date datetime=article.createdTime/></span>
            </div>
            <div class="markdown">${article.content}</div>
            <a class="more" href="#article/${article.id}">阅读全文 »</a>
        </li>
    </#list>
</ul>
<#else>
<div class="empty">
    没有符合条件的记录
</div>
</#if>

<#assign url="#${type}"/>

<#--分页-->
<#if (page.list)?? && page.pages gt 1>
<div class="page-div">
    <ul class="pagination">
        <#if page.hasPreviousPage>
            <li>
                <a href="${url}?p=${page.prePage}&key=${key}">&lt;</a>
            </li>
        </#if>

        <#list page.navigatepageNums as nav>
            <#if nav == page.pageNum>
                <li class="active">
                    <a href="javascript:">${nav}</a>
                </li>
            <#else>
                <li>
                    <a href="${url}?p=${nav}&key=${key}">${nav}</a>
                </li>
            </#if>
        </#list>

        <#if page.hasNextPage>
            <li>
                <a href="${url}?p=${page.nextPage}&key=${key}">&gt;</a>
            </li>
        </#if>
    </ul>
</div>
</#if>

<script>var key = '${key!''}';</script>
<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/web/index/index.js"></script>

