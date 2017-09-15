<#assign ctx="${(rca.contextPath)!''}">

<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="navigation">
    当前位置：&nbsp;
    <a href="#index">首页</a>
    &nbsp;>&nbsp;
    <a href="javascript:" class="active">留言</a>
</div>
<div class="navigation-line"></div>
<div class="space-10"></div>

<form class="guestbook-form" id="guestbook-form" action="${ctx}/guestbook/save" method="post">
    <div class="form-group">
        <textarea class="form-control" name="content" rows="5" placeholder="相遇便是缘分，留句话吧..."></textarea>
    </div>

    <div class="form-inline">
        <div class="form-group">
            <input type="text" class="form-control margin-right-10" name="realname" placeholder="昵称"/>
        </div>
        <div class="form-group">
            <input type="email" class="form-control margin-right-20" name="email" placeholder="邮箱 (审核后会发邮件通知您)"/>
        </div>

        <div class="form-group">
            <button class="btn btn-default" id="submit" data-toggle="form-submit"
                    data-loading-text="正在提交...">
            <@s.message "app.button.save"/>
            </button>
        </div>
    </div>

    <div class="space-20 clearboth"></div>

    <p id="resp-msg" class="red text-center"></p>
</form>

<div class="space-32"></div>

<div class="guest-line">
    <h3>留言
        <small>（${page.list?size}）</small>
    </h3>
</div>

<ul class="guestbook-list">
<#list page.list as guestbook>
    <li class="item">
        <div class="l pull-left">
            <img class="avatar" src="${ctx}/static/app/images/default_avatar.png" width="36" height="36" />
            <p class="ip-info">${guestbook.ipInfo}</p>
        </div>
        <div class="r pull-right">
            <div class="t">
                <div class="pull-left name">${guestbook.realname}</div>
                <div class="pull-right"><@c.relative_date datetime=guestbook.createdTime/></div>
            </div>

            <div class="space-4"></div>

            <div class="clearboth">
                ${guestbook.content}
            </div>

            <#if guestbook.replyMessage != ''>
                <div class="space-4"></div>

                <div class="reply-user">站长回复:</div>
                <div class="clearboth reply">
                    <div class="markdown">
                    ${guestbook.replyMessage}
                    </div>
                </div>
            </#if>
        </div>
    </li>
    <div class="line"></div>
</#list>
</ul>

<#--分页-->
<#if (page.list)?? && page.pages gt 1>
<div class="page-div">
    <ul class="pagination">
        <#if page.hasPreviousPage>
            <li>
                <a href="${url}?p=${page.prePage}">&lt;</a>
            </li>
        </#if>

        <#list page.navigatepageNums as nav>
            <#if nav == page.pageNum>
                <li class="active">
                    <a href="javascript:">${nav}</a>
                </li>
            <#else>
                <li>
                    <a href="${url}?p=${nav}">${nav}</a>
                </li>
            </#if>
        </#list>

        <#if page.hasNextPage>
            <li>
                <a href="${url}?p=${page.nextPage}">&gt;</a>
            </li>
        </#if>
    </ul>
</div>
</#if>

<script>
    document.title = "<@s.message "app.name"/> - 留言";
</script>
<script src="${ctx}/static/ace/dist/js/bootstrap.min.js"></script>
<script src="${ctx}/static/libs/jquery/jquery.form.min.js"></script>
<script src="${ctx}/static/libs/jquery/jquery.validate.min.js"></script>
<script src="${ctx}/static/libs/jquery/jquery.validate.extends.js"></script>
<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/web/guestbook/index.js"></script>

