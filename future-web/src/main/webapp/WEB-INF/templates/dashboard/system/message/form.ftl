<#assign ctx="${(rca.contextPath)!''}">
<div class="page-header">
    <h1>
        ${message.id???string('编辑', '发布')}消息
    </h1>
</div>

<link rel="stylesheet" href="${ctx}/static/libs/bootstrap/css/bootstrap-markdown.min.css"/>
<link rel="stylesheet" href="${ctx}/static/libs/select2/select2.min.css" />

<div class="col-xs-12">
    <form id="message-form" method="post" class="form-horizontal" action="${ctx}/dashboard/system/message/${message.id???string('update', 'save')}">

        <#if message.id??>
            <input type="hidden" name="id" value="${message.id}"/>
        </#if>

        <div class="form-group">
            <label for="title" class="col-sm-3 control-label no-padding-right">消息标题<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-5">
            <@s.formInput "message.title" 'class="form-control" placeholder="请输入消息标题，最多64个字符"' />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right">类型<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-5">
                <select name="type" class="form-control">
                <#list types as e>
                    <option value="${e.getType()}" <#if message.type=='${e.getType()}'>selected</#if>>${e.getName()}</option>
                </#list>
                </select>
            </div>
        </div>

        <#if !message.id??>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right">是否群发<span class="red">*</span></label>
                <div class="col-xs-12 col-sm-5">
                    <div class="radio">
                        <#assign yes={"1":"群发"}/>
                        <#assign no={"0":"定向"}/>
                        <label>
                            <@s.formRadioButtons "message.isGroup" yes "" 'class="ace"'/>
                        </label>
                        <label>
                            <@s.formRadioButtons "message.isGroup" no "" 'class="ace"'/>
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group hidden" id="select2-div">
                <label class="col-sm-3 control-label no-padding-right">接收消息的用户<span class="red">*</span></label>
                <div class="col-xs-12 col-sm-5">
                    <select multiple="" id="usernames" name="usernames" class="select2" data-placeholder="请选择接收消息的用户">
                        <#list users as user>
                            <option value="${user.username}">${user.realname}[${user.username}]</option>
                        </#list>
                    </select>
                </div>
            </div>
        </#if>

        <div class="form-group">
            <label for="body" class="col-sm-1 control-label no-padding-right">内容<span class="red">*</span></label>
            <div class="col-xs-12 col-sm-9">
            <@s.formTextarea "message.content" 'style="width:100%;height:560px;"' />
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
<script src="${ctx}/static/libs/select2/select2.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/system/message/form.js"></script>