<#assign ctx="${(rca.contextPath)!''}">
<div class="page-header">
    <h1>
    ${template.id???string('编辑', '新增')}模板
    </h1>
</div>

<div class="col-xs-12">
    <form id="template-form" method="post" class="form-horizontal"
          action="${ctx}/dashboard/tool/template/${template.id???string('update', 'save')}">

    <#if template.id??>
        <input type="hidden" name="id" value="${template.id}"/>
    </#if>

        <div class="form-group">
            <label for="title" class="col-sm-3 control-label no-padding-right">模板名称<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-5">
            <@s.formInput "template.name" 'class="form-control" placeholder="请输入模板名称，最多64个字符"' />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right">类型</label>
            <div class="col-xs-12 col-sm-5">
            <@s.formInput "template.type" 'class="form-control" placeholder="请输入类型，最多32个字符"' />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right">描述</label>
            <div class="col-xs-12 col-sm-5">
            <@s.formTextarea "template.description" 'style="width:100%;height:120px;"' />
            </div>
        </div>

        <div class="form-group">
            <label for="body" class="col-sm-1 control-label no-padding-right">模板<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-9">
            <@s.formTextarea "template.template" 'style="width:100%;height:400px;"' />
            </div>
        </div>

        <div class="form-group">
            <label for="body" class="col-sm-1 control-label no-padding-right">数据源<span class="red">*</span></label>
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
</div>

<script src="${ctx}/static/app/js/dashboard/tool/template/form.js"></script>