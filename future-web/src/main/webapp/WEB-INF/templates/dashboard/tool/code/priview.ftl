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
                        <span class="pageNumDisp">界面名称</span>
                        <small class="pull-right" id="topBtnGroup">
                            <a href="javascript:" class="btn btn-inverse btn-sm btnNameDisp">新增</a>
                        </small>
                    </h1>
                </div>

                <div class="space-10"></div>

                <table class="demo-table table table-striped table-bordered table-hover">
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

                <div class="pageDisp">
                    <div class="pull-right">
                        <ul class="pagination">
                            <li><a href="javascript:" class="page-info">第 1~5 条, 共 13 条,
                                第 1 页,
                                共 3 页</a></li>
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

                        <#list 1..3 as nav>
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
