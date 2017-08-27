<#assign ctx="${(rca.contextPath)!''}">

<tr id="message-${message.id}">
    <td>${message.id}</td>
    <td><a href="${ctx}/mobile/message/${message.id}" target="_blank">${message.title}</a></td>
    <td><#include "type.ftl"></td>
    <td><#include "is-group.ftl"></td>
    <td>${message.createdUsername}</td>
    <td><#include "delete.ftl"></td>
    <td><@c.relative_date datetime=message.createdTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#system/message/${message.id}">查看</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <li>
                    <a href="#system/message/${message.id}/edit">编辑</a>
                </li>
            <#if message.isDeleted==1>
                <li>
                    <a href="javascript:" data-role="message-remove" title="物理删除消息"
                       data-url="${ctx}/dashboard/system/message/${message.id}/remove">
                        物理删除
                    </a>
                </li>
            </#if>
            </ul>
        </div>
    </td>
</tr>