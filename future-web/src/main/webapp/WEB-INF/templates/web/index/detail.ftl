<#assign ctx="${(rca.contextPath)!''}">
<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="navigation">
    当前位置：
    &nbsp;<a href="#index">首页</a>
    &nbsp;>&nbsp;
    <a href="#category/${article.categoryCode}">${article.categoryName}</a>
    &nbsp;>&nbsp;
    <a href="javascript:" class="active">${article.title}</a>
</div>
<div class="navigation-line"></div>

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

    <div class="space-20"></div>

    <div class="article-bottom-nav">
        <a href="#article/${article.id}/prev" class="dark">&lt;&lt;&nbsp;上一篇文章</a>
        <a href="#article/${article.id}/next" class="pull-right dark">下一篇文章&nbsp;&gt;&gt;</a>
    </div>

    <div class="space-20"></div>
    <div class="detail-pay">
        <a href="javascript:">赏 <small>1分钱</small></a>
        <div class="hidden">
            <div class="channel">
                <img src="${ctx}/static/app/images/alipay.png"/>
                <div>支付宝打赏</div>
            </div>
            <div class="channel">
                <img src="${ctx}/static/app/images/chat-pay.png"/>
                <div>微信打赏</div>
            </div>
        </div>
    </div>
</div>

<script>
    document.title = "<@s.message "app.name"/> - ${article.title}";
</script>
<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/web/index/detail.js"></script>
