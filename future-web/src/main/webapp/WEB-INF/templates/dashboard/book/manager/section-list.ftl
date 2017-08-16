<#assign ctx="${(rca.contextPath)!''}">

<div class="book-info">
    <img src="${ctx}${book.picUrl}"/>
    <div class="r">
        <div class="author">${book.name}</div>
        <ul>
            <li>作者：${book.author}</li>
            <li>状态：${(book.isFinished==0)?string('连载中', '已完结')}</li>
        </ul>
        <ul>
            <#if newSection??>
                <li>最新章节：${newSection.title}</li>
            <#else>
                <li>最新章节：暂未抓取</li>
            </#if>
            <li>站长推荐：${(book.isHot==0)?string('未推荐', '已推荐')}</li>
        </ul>
    </div>

    <div class="clearboth"></div>
    <div class="descp">${book.descp}</div>
</div>

<div class="clearboth"></div>

<#if sections?size == 0>
<div class="space-32"></div>
<div class="space-32"></div>
<div class="space-32"></div>

<div class="center red">
    服务器正在排队抓取小说章节，也可以联系康永敢优先抓取《${book.name}》
</div>
<#else>
<div class="space-32"></div>
<ul class="book-sections-list">
    <#list sections as section>
        <li><a href="#book/manager/${section.code}/section">${section.title}</a></li>
    </#list>
</ul>
</#if>

<script src="${ctx}/static/app/js/dashboard/book/manager/section-list.js"></script>