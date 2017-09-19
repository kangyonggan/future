<#assign ctx="${(rca.contextPath)!''}">
<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="page-header">
    <h1>代码生成</h1>
</div>

<div class="col-xs-12">
    <form id="template-form" method="post" class="form-horizontal"
          action="${ctx}/dashboard/tool/template/${template.id}/generate">

        <div class="form-group">
            <label for="body" class="col-sm-2 control-label no-padding-right">模板</label>
            <div class="col-xs-12 col-sm-9">
            <@s.formTextarea "template.template" 'class="readonly" readonly style="width:100%;height:400px;"' />
            </div>
        </div>

        <div class="form-group">
            <label for="body" class="col-sm-2 control-label no-padding-right">数据源(json格式)<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-9">
            <@s.formTextarea "template.dataSource" 'style="width:100%;height:400px;"' />
            </div>
        </div>

        <div class="clearfix form-actions">
            <div class="col-xs-10 align-center">
                <button class="btn btn-inverse" id="submit" data-toggle="form-submit"
                        data-loading-text="正在<@s.message "app.button.save"/>...">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                <@s.message "app.button.save"/>
                </button>
            </div>
        </div>
    </form>

    <div id="generate-result" class="hidden">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="widget-box transparent">
                    <div class="widget-header widget-header-large">
                        <h3 class="widget-title grey lighter">
                            <i class="ace-icon fa fa-leaf dark"></i>
                            <span id="template-name"></span>
                        </h3>

                        <div class="widget-toolbar no-border invoice-info">
                            <span class="invoice-info-label">创建人:</span>
                            <span class="red" id="template-username"></span>

                            <br/>
                            <span class="invoice-info-label">分类:</span>
                            <span class="blue" id="template-type"></span>
                        </div>

                        <div class="widget-toolbar hidden-480">
                            <a href="#"></a>
                        </div>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main padding-24">

                            <div class="space-10"></div>

                            <pre id="template-result" class="prettyprint linenums"></pre>

                            <div class="space-20"></div>

                            <div class="hr hr8 hr-double hr-dotted"></div>

                            <div class="center">
                                <a class="btn btn-inverse btn-sm" href="javascript:window.location.reload();">重新生成</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/tool/template/generate.js"></script>