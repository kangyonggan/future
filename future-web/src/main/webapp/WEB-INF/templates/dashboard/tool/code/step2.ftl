<div class="step-pane" data-step="2">
    <div class="col-sm-6 col-xs-12">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-tint"></i>
                    配置选择
                </h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">界面名称<span
                                    class="red">*</span></label>

                            <div class="col-xs-12 col-sm-8">
                                <input type="text" id="pageName" name="pageName" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">
                                是否需要顶部按钮<a class="help-button" href="#" target="_blank" title="顶部按钮说明">?</a>
                            </label>

                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-3">
                                    <div class="space-4"></div>
                                    <label>
                                        <input id="needAdd" name="needAdd" class="ace ace-switch ace-switch-2" checked
                                               type="checkbox">
                                        <span class="lbl"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" id="topBtnName">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">按钮名称<span
                                    class="red">*</span></label>
                            <div class="col-xs-12 col-sm-8">
                                <input type="text" class="form-control" id="addBtnName" name="addBtnName" placeholder="请输入新增按钮的名称"/>
                            </div>
                        </div>

                        <div class="form-group" id="topBtnType">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">
                                按钮模式<a class="help-button" href="#" target="_blank" title="顶部按钮说明">?</a>
                            </label>

                            <div class="col-xs-12 col-sm-8">
                                <div class="space-4"></div>
                                <label>
                                    <input name="addBtnType" value="0" checked type="radio" class="ace">
                                    <span class="lbl"> 界面跳转 </span>
                                </label>

                                <label>
                                    <input name="addBtnType" value="1" type="radio" class="ace">
                                    <span class="lbl"> 弹出层</span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">是否需要分页功能</label>

                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-3">
                                    <div class="space-4"></div>
                                    <label>
                                        <input name="needAdd" class="ace ace-switch ace-switch-2" checked
                                               type="checkbox">
                                        <span class="lbl"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="space-30 hidden-lg hidden-md hidden-sm"></div>

    <div class="col-sm-6 col-xs-12">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-tint"></i>
                    实时预览
                </h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div class="page-header">
                        <h1>
                            <span id="pageNumDisp">界面名称</span>
                            <small class="pull-right" id="topBtnGroup">
                                <a href="${ctx}/dashboard/system/user/create" class="btn btn-sm btn-inverse" data-toggle="modal" data-target="#myModal"
                                   data-backdrop="static" id="btnNameDisp">新增</a>
                            </small>
                        </h1>
                    </div>

                    <div class="space-10"></div>

                    <table id="user-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>手机号</th>
                            <th>真实姓名</th>
                            <th>电子邮箱</th>
                            <th>用户头像</th>
                            <th>逻辑删除</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="20">
                                <div class="empty">暂无查询记录</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                <#--<@c.pagination url="#system/user" param="username=${username}&realname=${realname}&email=${email}"/>-->
                </div>
            </div>
        </div>
    </div>
</div>