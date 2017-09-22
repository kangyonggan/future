<#assign ctx="${(rca.contextPath)!''}">

<div class="page-header">
    <h1>
        数据库表
        <small class="pull-right">
            <a class="btn btn-sm btn-inverse" href="#tool/code/table/create">新增表</a>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<table id="table-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>表名</th>
        <th>备注</th>
        <th>记录数</th>
        <th>创建时间</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if tables?size gt 0>
        <#list tables as table>
            <#include "table-tr.ftl"/>
        </#list>
    <#else>
    <tr>
        <td colspan="20">
            <div class="empty">暂无查询记录</div>
        </td>
    </tr>
    </#if>
    </tbody>
</table>

<script src="${ctx}/static/app/js/dashboard/tool/template/list.js"></script>
