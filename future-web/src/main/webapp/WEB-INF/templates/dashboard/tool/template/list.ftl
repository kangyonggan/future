<#assign ctx="${(rca.contextPath)!''}">
<#assign type = RequestParameters.type!'' />
<#assign name = RequestParameters.name!'' />

<div class="page-header">
    <h1>
        模板列表
        <small class="pull-right">
            <a class="btn btn-sm btn-inverse" href="#tool/template/create">新增模板</a>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get" novalidate>
    <div class="form-group">
        <select name="type" class="form-control">
            <option value="">--选择分类--</option>
        <#list types as tp>
            <option value="${tp}" <#if tp=='${type}'>selected</#if>>${tp}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="name" value="${name}" placeholder="模板名称"/>
    </div>

    <button class="btn btn-sm btn-inverse" data-toggle="search-submit">
        搜索
        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
    </button>
</form>

<div class="space-10"></div>

<table id="template-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>模板名称</th>
        <th>分类</th>
        <th>描述</th>
        <th>逻辑删除</th>
        <th>创建时间</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if page.list?size gt 0>
        <#list page.list as template>
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
<@c.pagination url="#tool/template" param="type=${type}&name=${name}"/>

<script src="${ctx}/static/app/js/dashboard/tool/template/list.js"></script>
