<#assign ctx="${(rca.contextPath)!''}">

<link rel="stylesheet" href="${ctx}/static/ace/dist/css/select2.min.css"/>

<div class="page-header">
    <h1>
    ${table.tableComment}
    </h1>
</div>

<div class="space-10"></div>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">
            <div class="widget-header widget-header-blue widget-header-flat">
                <h4 class="widget-title lighter">生成向导</h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div id="fuelux-wizard-container">
                        <div>
                            <ul class="steps">
                                <li data-step="1" class="active">
                                    <span class="step">1</span>
                                    <span class="title">列表界面</span>
                                </li>

                                <li data-step="2">
                                    <span class="step">2</span>
                                    <span class="title">表单界面</span>
                                </li>

                                <li data-step="3">
                                    <span class="step">3</span>
                                    <span class="title">详情界面</span>
                                </li>

                                <li data-step="4">
                                    <span class="step">4</span>
                                    <span class="title">完成</span>
                                </li>
                            </ul>
                        </div>

                        <hr/>

                        <div class="step-content pos-rel">
                        <#include "step1.ftl">

                        <#include "step2.ftl">

                            <div class="step-pane" data-step="3">

                            </div>

                            <div class="step-pane" data-step="4">

                            </div>
                        </div>
                    </div>

                    <div class="clearboth"></div>

                    <hr/>

                    <div class="wizard-actions">
                        <button class="btn btn-prev">
                            <i class="ace-icon fa fa-arrow-left"></i>
                            上一步
                        </button>

                        <button class="btn btn-inverse btn-next" data-last="Finish">
                            下一步
                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // 是否需要添加按钮
    var needAdd = false;
    // 按钮模式
    var addBtnType = "0";

    <#if step1.needAdd??>
    needAdd = true;
    </#if>
    <#if step1.addBtnType?? && step1.addBtnType=='1'>
    addBtnType = "1";
    </#if>

    // 表格的列
    var columns = [];
    var tempIndex = 0;
    <#list columns as column>
        <#if step1.columns??>
            <#if step1.columns?seq_contains(column.field)>
                <#assign index=column.comment?index_of(":")/>
                <#if index==-1>
                columns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
                <#else>
                columns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment?substring(0, index)}"};
                </#if>
            </#if>
        <#else>
            <#assign index=column.comment?index_of(":")/>
            <#if index==-1>
            columns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
            <#else>
            columns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment?substring(0, index)}"};
            </#if>
        </#if>
    </#list>

    // 搜索的列
    var searchColumns = [];
    tempIndex = 0;
    <#list columns as column>
        <#if column.field != 'id' && column.field != 'is_deleted' && column.field != 'created_time' && column.field != 'updated_time'>
            <#if step1.searchColumns??>
                <#if step1.searchColumns?seq_contains(column.field)>
                    <#assign index=column.comment?index_of(":")/>
                    <#if index==-1>
                    searchColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
                    <#else>
                    searchColumns[tempIndex++] = {
                        "field": "${column.field}",
                        "comment": "${column.comment?substring(0, index)}"
                    };
                    </#if>
                </#if>
            <#else>
                <#assign index=column.comment?index_of(":")/>
                <#if index==-1>
                searchColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
                <#else>
                searchColumns[tempIndex++] = {
                    "field": "${column.field}",
                    "comment": "${column.comment?substring(0, index)}"
                };
                </#if>
            </#if>
        </#if>
    </#list>
</script>
<script src="${ctx}/static/ace/dist/js/select2.min.js"></script>
<script src="${ctx}/static/ace/dist/js/fuelux/fuelux.wizard.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/tool/code/generate.js"></script>
