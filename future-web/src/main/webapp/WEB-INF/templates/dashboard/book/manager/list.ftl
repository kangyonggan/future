<#assign ctx="${(rca.contextPath)!''}">
<#assign bookCode = RequestParameters.bookCode!'' />
<#assign bookName = RequestParameters.bookName!'' />
<#assign author = RequestParameters.author!'' />
<#assign categoryCode = RequestParameters.categoryCode!'' />
<#assign isFinished = RequestParameters.isFinished!'' />
<#assign isHot = RequestParameters.isHot!'' />
<#assign isAutoUpdate = RequestParameters.isAutoUpdate!'' />

<div class="page-header">
    <h1>
        小说列表
        <small class="pull-right">
            <a class="btn btn-sm btn-purple" href="${ctx}/dashboard/book/manager/update" id="book-update">抓取小说</a>
            <a class="btn btn-sm btn-success" href="${ctx}/dashboard/book/manager/section/update" id="section-update">抓取章节</a>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get" novalidate>
    <div class="form-group">
        <select name="categoryCode" class="form-control">
            <option value="">--选择分类--</option>
        <#list categories as c>
            <option value="${c.code}" <#if categoryCode=='${c.code}'>selected</#if>>${c.name}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <select name="isFinished" class="form-control">
            <option value="">--是否完结--</option>
            <option value="1" <#if isFinished=='1'>selected</#if>>已完结</option>
            <option value="0" <#if isFinished=='0'>selected</#if>>连载中</option>
        </select>
    </div>
    <div class="form-group">
        <select name="isHot" class="form-control">
            <option value="">--是否推荐--</option>
            <option value="1" <#if isHot=='1'>selected</#if>>推荐</option>
            <option value="0" <#if isHot=='0'>selected</#if>>未推荐</option>
        </select>
    </div>
    <div class="form-group">
        <select name="isAutoUpdate" class="form-control">
            <option value="">--是否自动更新--</option>
            <option value="1" <#if isAutoUpdate=='1'>selected</#if>>自动</option>
            <option value="0" <#if isAutoUpdate=='0'>selected</#if>>手动</option>
        </select>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="author" value="${author}" placeholder="作者"/>
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
        <th>ID</th>
        <th>小说代码</th>
        <th>小说名称</th>
        <th>作者</th>
        <th>分类</th>
        <th>封面</th>
        <th>是否完结</th>
        <th>是否推荐</th>
        <th>是否自动更新</th>
        <th>最新章节</th>
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
<@c.pagination url="#book/manager" param="bookCode=${bookCode}&bookName=${bookName}&author=${author}&categoryCode=${categoryCode}&isFinished=${isFinished}&isHot=${isHot}"/>

<script src="${ctx}/static/app/js/dashboard/book/manager/list.js"></script>
