<#assign ctx="${(rca.contextPath)!''}">

<div class="page-header">
    <h1>
        生成结果
    </h1>
</div>

<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="widget-box transparent">
            <div class="widget-header widget-header-large">
                <h3 class="widget-title grey lighter">
                    <i class="ace-icon fa fa-leaf dark"></i>
                    ${template.name}
                </h3>

                <div class="widget-toolbar no-border invoice-info">
                    <span class="invoice-info-label">创建时间:</span>
                    <span class="red"><@c.relative_date datetime=template.createdTime/></span>

                    <br/>
                    <span class="invoice-info-label">分类:</span>
                    <span class="blue">${article.type}</span>
                </div>

                <div class="widget-toolbar hidden-480">
                    <a href="#"></a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main padding-24">

                    <div class="space-10"></div>

                    <div>
                        ${result}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/app/js/dashboard/tool/template/result.js"></script>