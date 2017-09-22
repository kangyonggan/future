<div class="step-pane" data-step="1">
    <div class="col-sm-6 col-xs-12">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-cogs"></i>
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
                                <input type="text" id="pageName" name="pageName" class="form-control"
                                       placeholder="请输入界面名称">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">
                                是否需要顶部按钮<span class="help-button" data-rel="popover" data-trigger="hover"
                                              data-placement="left" data-content="顶部按钮目前只有一个新增功能" title=""
                                              data-original-title="说明">?</span>
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
                                <input type="text" class="form-control" id="addBtnName" name="addBtnName"
                                       placeholder="请输入新增按钮的名称"/>
                            </div>
                        </div>

                        <div class="form-group" id="topBtnType">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">
                                按钮模式
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
                                        <input name="needPage" id="needPage" class="ace ace-switch ace-switch-2" checked
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

    <#include "priview.ftl">
</div>