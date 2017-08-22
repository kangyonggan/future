<#assign ctx="${(rca.contextPath)!''}">

<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="page-header">
    <h1>
        文章详情
        <small class="pull-right">
        <#if article.status=="waiting">
        <#--待审核-->
            <a href="javascript:" data-role="article-detail" title="审核通过"
               data-url="${ctx}/dashboard/user/review/${article.id}/complete" class="btn btn-sm btn-success">审核通过</a>
            <a href="javascript:" data-role="article-detail" title="审核不通过"
               data-url="${ctx}/dashboard/user/review/${article.id}/reject" class="btn btn-sm btn-danger">审核不通过</a>
        <#elseif article.status=="reject" || article.status=="complete">
        <#--审核不通过 和 审核通过-->
            <a href="javascript:" data-role="article-detail" title="撤销审核"
               data-url="${ctx}/dashboard/user/review/${article.id}/waiting" class="btn btn-sm btn-inverse">撤销审核</a>
        </#if>
        </small>
    </h1>
</div>

<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="widget-box transparent">
            <div class="widget-header widget-header-large">
                <h3 class="widget-title grey lighter">
                    <i class="ace-icon fa fa-leaf dark"></i>
                ${article.title}
                </h3>

                <div class="widget-toolbar no-border invoice-info">
                    <span class="invoice-info-label">发布人:</span>
                    <span class="red">${article.username}</span>

                    <br/>
                    <span class="invoice-info-label">栏目:</span>
                    <span class="blue">${article.categoryName}</span>
                </div>

                <div class="widget-toolbar hidden-480">
                    <a href="#"></a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main padding-24">

                    <div class="space-10"></div>

                    <div class="markdown">
                    ${article.content}
                    </div>

                    <div class="space-20"></div>

                    <div class="hr hr8 hr-double hr-dotted"></div>

                    <div>
                        <a href="#user/review/${article.id}/prev" class="dark">&lt;&lt;&nbsp;上一篇文章</a>
                        <a href="#user/review/${article.id}/next" class="pull-right dark">下一篇文章&nbsp;&gt;&gt;</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/user/review/detail.js"></script>