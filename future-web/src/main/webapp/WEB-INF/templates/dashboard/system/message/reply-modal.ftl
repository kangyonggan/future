<#assign ctx="${(rca.contextPath)!''}">
<#assign modal_title="回复消息" />

<@override name="modal-body">
<form class="form-horizontal" role="form" id="modal-form" method="post"
      action="${ctx}/dashboard/system/message/${id}/reply">
    <div class="row">
        <div class="row form-group">
            <div class="col-md-offset-1 col-md-10 col-md-offset-1">
                <textarea class="form-control limited" id="content" placeholder="支持markdown语法" name="content" maxlength="500" style="height:200px;"></textarea>
            </div>
        </div>
    </div>
</form>
</@override>

<@override name="modal-footer">
<button class="btn btn-sm" data-dismiss="modal">
    <i class="ace-icon fa fa-times"></i>
    <@s.message "app.button.cancel"/>
</button>

<button class="btn btn-sm btn-inverse" id="submit" data-loading-text="正在保存..." data-toggle="form-submit" data-target="#modal-form">
    <i class="ace-icon fa fa-check"></i>
    <@s.message "app.button.save"/>
</button>

<script src="${ctx}/static/libs/jquery/jquery.inputlimiter.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/system/message/form-modal.js"></script>
</@override>

<@extends name="../../../modal-layout.ftl"/>