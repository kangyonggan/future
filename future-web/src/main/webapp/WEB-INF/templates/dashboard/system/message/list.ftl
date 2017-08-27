<#assign ctx="${(rca.contextPath)!''}">
<#assign title = RequestParameters.title!'' />
<#assign type = RequestParameters.type!'' />
<#assign createdUsername = RequestParameters.createdUsername!'' />

<div class="page-header">
    <h1>
        消息列表
        <small class="pull-right">
            <a href="#system/message/create" class="btn btn-sm btn-inverse">发布</a>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get" novalidate>
    <div class="form-group">
        <select name="type" class="form-control">
            <option value="">全部类型</option>
        <#list types as e>
            <option value="${e.getType()}" <#if type=='${e.getType()}'>selected</#if>>${e.getName()}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="createdUsername" value="${createdUsername}" placeholder="发布人"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="title" value="${title}" placeholder="标题"/>
    </div>

    <button class="btn btn-sm btn-inverse" data-toggle="search-submit">
        搜索
        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
    </button>
</form>

<div class="space-10"></div>

<table id="message-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>标题</th>
        <th>类型</th>
        <th>是否群发</th>
        <th>发布人</th>
        <th>逻辑删除</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if page.list?size gt 0>
        <#list page.list as message>
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
<@c.pagination url="#system/message" param="type=${type}&title=${title}&createdUsername=${createdUsername}"/>

<script src="${ctx}/static/app/js/dashboard/system/message/list.js"></script>
