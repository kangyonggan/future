<#assign ctx="${(rca.contextPath)!''}">
<#assign modal_title="回复留言" />

<@override name="modal-body">
<form class="form-horizontal" role="form" id="modal-form" method="post"
      action="${ctx}/dashboard/web/guestbook/${id}/reply">
    <div class="row">
        <div class="row form-group">
            <div class="col-md-offset-1 col-md-10 col-md-offset-1">
                <textarea class="form-control limited" id="replyMessage" placeholder="支持markdown语法" name="replyMessage" maxlength="10240" style="height:200px;"></textarea>
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
<script src="${ctx}/static/app/js/dashboard/web/guestbook/form-modal.js"></script>
</@override>

<@extends name="../../../modal-layout.ftl"/>