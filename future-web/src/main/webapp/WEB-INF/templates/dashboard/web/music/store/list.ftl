<#assign ctx="${(rca.contextPath)!''}">
<#assign name = RequestParameters.name!'' />
<#assign singer = RequestParameters.singer!'' />
<#assign uploadUsername = RequestParameters.uploadUsername!'' />

<div class="page-header">
    <h1>
        音乐库
        <small class="pull-right">
            <a href="${ctx}/dashboard/web/music/store/create" class="btn btn-sm btn-inverse" data-backdrop="static"
               data-toggle="modal"
               data-target="#myModal">上传音乐</a>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get">
    <div class="form-group">
        <input type="text" class="form-control" name="name" value="${name}" placeholder="歌曲名"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="singer" value="${singer}" placeholder="歌手"/>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="uploadUsername" value="${uploadUsername}" placeholder="上传者"/>
    </div>

    <button class="btn btn-sm btn-inverse" data-toggle="search-submit">
        搜索
        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
    </button>
</form>

<div class="space-10"></div>

<table id="music-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>歌曲名</th>
        <th>歌手</th>
        <th>专辑</th>
        <th>时长</th>
        <th>大小</th>
        <th>上传者</th>
        <th>是否置顶</th>
        <th>更新时间</th>
        <th>试听</th>
    </tr>
    </thead>
    <tbody>
    <#if page.list?? && page.list?size gt 0>
        <#list page.list as music>
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
<@c.pagination url="#web/music/store" param="name=${name}&singer=${singer}&uploadUsername=${uploadUsername}"/>

<script src="${ctx}/static/app/js/dashboard/web/music/store/list.js"></script>
