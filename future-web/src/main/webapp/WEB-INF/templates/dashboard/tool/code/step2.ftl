<div class="step-pane" data-step="2">
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
                                是否需要顶部按钮<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="顶部按钮目前只有一个新增功能" title="" data-original-title="说明">?</span>
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

    <div class="col-sm-6 col-xs-12">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-eye"></i>
                    实时预览
                </h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div class="page-header">
                        <h1>
                            <span id="pageNumDisp">界面名称</span>
                            <small class="pull-right" id="topBtnGroup">
                                <a href="javascript:" class="btn btn-inverse btn-sm" id="btnNameDisp">新增</a>
                            </small>
                        </h1>
                    </div>

                    <div class="space-10"></div>

                    <table id="demo-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>字段1</th>
                            <th>字段2</th>
                            <th>字段3</th>
                            <th>字段4</th>
                            <th>逻辑删除</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list demos as demo>
                        <tr>
                            <td>${demo.id}</td>
                            <td>${demo.column1}</td>
                            <td>${demo.column2}</td>
                            <td>${demo.column3}</td>
                            <td>${demo.column4}</td>
                            <td>
                                <#if demo.isDeleted == 1>
                                    <span class="label label-danger arrowed-in">已删除</span>
                                <#else>
                                    <span class="label label-success arrowed-in">未删除</span>
                                </#if>
                            </td>
                            <td><@c.relative_date datetime=demo.createdTime/></td>
                            <td><@c.relative_date datetime=demo.updatedTime/></td>
                            <td>
                                <div class="btn-group">
                                    <a class="btn btn-xs btn-inverse" href="javascript:">查看</a>

                                    <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                                        <span class="ace-icon fa fa-caret-down icon-only"></span>
                                    </button>

                                    <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                                        <li>
                                            <a href="javascript:">编辑</a>
                                        </li>

                                        <#if demo.isDeleted==1>
                                            <li>
                                                <a href="javascript:">彻底删除</a>
                                            </li>
                                        </#if>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>

                    <div id="pageDisp">
                        <div class="pull-right">
                            <ul class="pagination">
                                <li><a href="javascript:" class="page-info">第 1~10 条, 共 1234 条,
                                    第 1 页,
                                    共 124 页</a></li>
                            </ul>
                        </div>
                        <div class="pull-left">
                            <ul class="pagination">
                                <li>
                                    <a href="javascript:">
                                        <i class="ace-icon fa fa-angle-double-left"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:">
                                        <i class="ace-icon fa fa-angle-left"></i>
                                    </a>
                                </li>

                            <#list 1..8 as nav>
                                <#if nav == 1>
                                    <li class="active">
                                        <a href="javascript:">${nav}</a>
                                    </li>
                                <#else>
                                    <li>
                                        <a href="javascript:">${nav}</a>
                                    </li>
                                </#if>
                            </#list>
                                <li>
                                    <a href="javascript:">
                                        <i class="ace-icon fa fa-angle-right"></i>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:">
                                        <i class="ace-icon fa fa-angle-double-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="clearboth"></div>
                </div>
            </div>
        </div>
    </div>
</div>