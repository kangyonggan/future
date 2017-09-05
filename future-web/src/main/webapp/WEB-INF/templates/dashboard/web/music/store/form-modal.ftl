<#assign ctx="${(rca.contextPath)!''}">
<#assign modal_title="上传音乐" />

<@override name="modal-body">
<form class="form-horizontal" role="form" id="modal-form" method="post" action="${ctx}/dashboard/web/music/store/save" enctype="multipart/form-data">
    <div class="row">
        <div class="row form-group">
            <div class="col-md-3 control-label">
                <label>选择mp3文件<span class="red">*</span></label>
            </div>
            <div class="col-md-7 controls">
                <input type="file" id="file" name="file" class="ace ace-file-input"/>
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

<button class="btn btn-sm btn-inverse" id="submit" data-loading-text="正在<@s.message "app.button.save"/>..." data-toggle="form-submit" data-target="#modal-form">
    <i class="ace-icon fa fa-check"></i>
    <@s.message "app.button.save"/>
</button>

<script src="${ctx}/static/app/js/dashboard/web/music/store/form-modal.js"></script>
</@override>

<@extends name="../../../../modal-layout.ftl"/>