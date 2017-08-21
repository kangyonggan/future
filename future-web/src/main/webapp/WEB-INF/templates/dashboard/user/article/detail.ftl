<#assign ctx="${(rca.contextPath)!''}">
<div class="page-header">
    <h1>
        文章详情
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
                    <span class="invoice-info-label">发布时间:</span>
                    <span class="red"><@c.relative_date datetime=article.createdTime/></span>

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
                        <a href="#user/article/${article.id}/prev" class="dark">&lt;&lt;&nbsp;上一篇文章</a>
                        <a href="#user/article/${article.id}/next" class="pull-right dark">下一篇文章&nbsp;&gt;&gt;</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/app/js/dashboard/user/article/detail.js"></script>