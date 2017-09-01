<#assign ctx="${(rca.contextPath)!''}">

<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="page-header">
    <h1>
        留言详情
        <small class="pull-right">
        <#if guestbook.status=="waiting">
        <#--待审核-->
            <a href="javascript:" data-role="guestbook-detail" title="审核通过"
               data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/complete" class="btn btn-sm btn-success">审核通过</a>
            <a href="javascript:" data-role="guestbook-detail" title="审核不通过"
               data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/reject" class="btn btn-sm btn-danger">审核不通过</a>
        <#elseif guestbook.status=="reject">
        <#--审核不通过-->
            <a href="javascript:" data-role="guestbook-detail" title="撤销审核"
               data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/waiting" class="btn btn-sm btn-inverse">撤销审核</a>
        <#elseif guestbook.status=="complete">
            <a href="javascript:" data-role="guestbook-detail" title="撤销审核"
               data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/waiting" class="btn btn-sm btn-inverse">撤销审核</a>
            <#if guestbook.replyUsername == ''>
                <a href="${ctx}/dashboard/web/guestbook/${guestbook.id}/reply" data-target="#myModal" data-toggle="modal"
                   class="btn btn-sm btn-inverse">回复</a>
            </#if>
        </#if>
        </small>
    </h1>
</div>

<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="widget-box transparent">
            <div class="widget-header widget-header-large">
                <h5 class="widget-title grey lighter">
                    <i class="ace-icon fa fa-leaf dark"></i>
                ${guestbook.content}
                </h5>

                <div class="widget-toolbar no-border invoice-info">
                    <span class="invoice-info-label">昵称:</span>
                    <span class="red">${guestbook.realname}</span>

                    <br/>
                    <span class="invoice-info-label">邮箱:</span>
                    <span class="blue">${guestbook.email}</span>
                </div>

                <div class="widget-toolbar hidden-480">
                    <a href="#"></a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main padding-24">

                    <div class="space-10"></div>

                    <h5><i class="ace-icon fa fa-comments-o icon-only"></i>站长回复</h5>

                    <div class="markdown">
                        <#if guestbook.replyMessage == ''>
                            <div class="align-center">
                                <h5 class="red">未回复</h5>
                            </div>
                        <#else>
                        ${guestbook.replyMessage}
                        </#if>
                    </div>

                    <div class="space-20"></div>

                    <div class="hr hr8 hr-double hr-dotted"></div>

                    <div>
                        <a href="#web/guestbook/${guestbook.id}/prev" class="dark">&lt;&lt;&nbsp;上一个留言</a>
                        <a href="#web/guestbook/${guestbook.id}/next" class="pull-right dark">下一个留言&nbsp;&gt;&gt;</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/web/guestbook/detail.js"></script>