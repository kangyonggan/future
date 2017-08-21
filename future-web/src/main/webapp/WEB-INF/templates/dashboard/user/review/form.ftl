<#assign ctx="${(rca.contextPath)!''}">

<link rel="stylesheet" href="${ctx}/static/libs/bootstrap/css/bootstrap-markdown.min.css"/>

<div class="page-header">
    <h1>
        编辑文章
    </h1>
</div>

<div class="col-xs-12">
    <form id="article-form" method="post" class="form-horizontal" action="${ctx}/dashboard/user/review/update">

        <input type="hidden" name="id" value="${article.id}"/>
        <div class="form-group">
            <label for="title" class="col-sm-3 control-label no-padding-right">文章标题<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-5">
            <@s.formInput "article.title" 'class="form-control" placeholder="请输入文章标题，最多64个字符"' />
            </div>
        </div>

        <div class="form-group">
            <label for="title" class="col-sm-3 control-label no-padding-right">发布人手机号</label>
            <div class="col-xs-12 col-sm-5">
            <@s.formInput "article.username" 'readonly class="form-control readonly"' />
            </div>
        </div>

        <div class="form-group" style="position: relative;">
            <label class="col-sm-3 control-label no-padding-right">所属栏目<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-5">
                <select name="categoryCode" class="form-control">
                <#list categories as category>
                    <option value="${category.code}"
                            <#if article.categoryCode=='${category.code}'>selected</#if>>${category.name}</option>
                </#list>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="body" class="col-sm-1 control-label no-padding-right">内容<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-9">
            <@s.formTextarea "article.content" 'style="width:100%;height:560px;"' />
            </div>
        </div>

        <div class="clearfix form-actions">
            <div class="col-xs-10 align-center">
                <button class="btn btn-inverse" id="submit" data-toggle="form-submit" data-loading-text="正在保存...">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                <@s.message "app.button.save"/>
                </button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="${ctx}/static/libs/bootstrap/js/marked.min.js"></script>
<script type="text/javascript" src="${ctx}/static/libs/bootstrap/js/bootstrap-markdown.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/user/review/form.js"></script>