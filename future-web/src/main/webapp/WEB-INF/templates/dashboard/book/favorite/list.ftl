<#assign ctx="${(rca.contextPath)!''}">
<#assign username = RequestParameters.username!'' />
<#assign bookCode = RequestParameters.bookCode!'' />
<#assign bookName = RequestParameters.bookName!'' />

<div class="page-header">
    <h1>
        小说收藏
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get" novalidate>
    <div class="form-group">
        <input type="text" class="form-control" name="username" value="${username}" placeholder="手机号"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="bookCode" value="${bookCode}" placeholder="小说代码"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="bookName" value="${bookName}" placeholder="小说名称"/>
    </div>

    <button class="btn btn-sm btn-inverse" data-toggle="search-submit">
        搜索
        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
    </button>
</form>

<div class="space-10"></div>

<table id="book-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>手机号</th>
        <th>小说代码</th>
        <th>小说名称</th>
        <th>作者</th>
        <th>分类</th>
        <th>封面</th>
        <th>是否完结</th>
        <th>是否推荐</th>
        <th>是否自动更新</th>
        <th>最新章节</th>
        <th>最后阅读章节</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if page.list?size gt 0>
        <#list page.list as book>
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
<@c.pagination url="#book/favorite" param="username=${username}&bookCode=${bookCode}&bookName=${bookName}"/>

<script src="${ctx}/static/app/js/dashboard/book/favorite/list.js"></script>
