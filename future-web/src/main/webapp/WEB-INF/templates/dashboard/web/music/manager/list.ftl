<#assign ctx="${(rca.contextPath)!''}">
<#assign name = RequestParameters.name!'' />
<#assign singer = RequestParameters.singer!'' />
<#assign status = RequestParameters.status!'' />
<#assign isStick = RequestParameters.isStick!'' />
<#assign isDeleted = RequestParameters.isDeleted!'' />
<#assign uploadUsername = RequestParameters.uploadUsername!'' />

<div class="page-header">
    <h1>
        音乐列表
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get">
    <select name="status" class="form-control">
        <option value="">审核状态</option>
    <#list articleStatus as a>
        <option value="${a.getStatus()}" <#if status=='${a.getStatus()}'>selected</#if>>${a.getName()}</option>
    </#list>
    </select>
    <select name="isStick" class="form-control">
        <option value="">--全部--</option>
        <option value="0" <#if isStick=='1'>selected</#if>>--未置顶--</option>
        <option value="1" <#if isStick=='1'>selected</#if>>--已置顶--</option>
    </select>
    <select name="isDeleted" class="form-control">
        <option value="">--全部--</option>
        <option value="0" <#if isDeleted=='1'>selected</#if>>--未删除--</option>
        <option value="1" <#if isDeleted=='1'>selected</#if>>--已删除--</option>
    </select>
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
        <th>时长(秒)</th>
        <th>大小(byte)</th>
        <th>上传者</th>
        <th>审核状态</th>
        <th>逻辑删除</th>
        <th>是否置顶</th>
        <th>创建时间</th>
        <th>更新时间</th>
        <th>操作</th>
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
<@c.pagination url="#web/music/manager" param="status=${status}&isStick=${isStick}&isDeleted=${isDeleted}&name=${name}&singer=${singer}&uploadUsername=${uploadUsername}"/>

<script src="${ctx}/static/app/js/dashboard/web/music/manager/list.js"></script>
