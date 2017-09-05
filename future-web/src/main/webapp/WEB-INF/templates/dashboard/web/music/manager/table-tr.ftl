<#assign ctx="${(rca.contextPath)!''}">

<tr id="music-${music.id}">
    <td>${music.id}</td>
    <td><a target="_blank" href="${ctx}/music/${music.singer} - ${music.name}.mp3">${music.name}</a></td>
    <td>${music.singer}</td>
    <td><a href="${ctx}/${music.albumCoverPath}" target="_blank">${music.album}</a></td>
    <td>${music.duration}</td>
    <td>${music.size}</td>
    <td>${music.uploadUsername}</td>
    <td><#include "status.ftl"></td>
    <td><#include "delete.ftl"></td>
    <td><#include "stick.ftl"></td>
    <td><@c.relative_date datetime=music.createdTime/></td>
    <td><@c.relative_date datetime=music.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" target="_blank" href="${ctx}/music/${music.singer} - ${music.name}.mp3">试听</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
            <#if music.status=="waiting">
            <#--待审核-->
                <li>
                    <a href="javascript:" data-role="music-tr" title="审核通过"
                       data-url="${ctx}/dashboard/web/music/manager/${music.id}/complete">审核通过</a>
                </li>
                <li>
                    <a href="javascript:" data-role="music-tr" title="审核不通过"
                       data-url="${ctx}/dashboard/web/music/manager/${music.id}/reject">审核不通过</a>
                </li>
            <#elseif music.status=="reject" || music.status=="complete">
            <#--审核不通过 和 审核通过-->
                <li>
                    <a href="javascript:" data-role="music-tr" title="撤销审核"
                       data-url="${ctx}/dashboard/web/music/manager/${music.id}/waiting">撤销审核</a>
                </li>
            </#if>

            <#if music.isDeleted==1>
                <li>
                    <a href="javascript:" data-role="music-remove" title="彻底删除"
                       data-url="${ctx}/dashboard/web/music/manager/${music.id}/remove">彻底删除</a>
                </li>
            </#if>
            </ul>
        </div>
    </td>
</tr>