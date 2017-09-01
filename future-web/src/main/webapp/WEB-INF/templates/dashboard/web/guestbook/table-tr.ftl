<#assign ctx="${(rca.contextPath)!''}">

<tr id="guestbook-${guestbook.id}">
    <td>${guestbook.id}</td>
    <td>${guestbook.realname}</td>
    <td>${guestbook.email}</td>
    <td><@c.substring guestbook.content 20/></td>
    <td>${guestbook.ip}<small>&nbsp;${guestbook.ipInfo}</small></td>
    <td><#include "status.ftl"></td>
    <td><#include "delete.ftl"></td>
    <td><@c.relative_date datetime=guestbook.createdTime/></td>
    <td><@c.relative_date datetime=guestbook.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#web/guestbook/${guestbook.id}">查看</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
            <#if guestbook.status=="waiting">
            <#--待审核-->
                <li>
                    <a href="javascript:" data-role="guestbook-tr" title="审核通过"
                       data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/complete">审核通过</a>
                </li>
                <li>
                    <a href="javascript:" data-role="guestbook-tr" title="审核不通过"
                       data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/reject">审核不通过</a>
                </li>
            <#elseif guestbook.status=="reject" || guestbook.status=="complete">
            <#--审核不通过 和 审核通过-->
                <li>
                    <a href="javascript:" data-role="guestbook-tr" title="撤销审核"
                       data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/waiting">撤销审核</a>
                </li>
            </#if>

            <#if guestbook.isDeleted==1>
                <li>
                    <a href="javascript:" data-role="guestbook-remove" title="彻底删除"
                       data-url="${ctx}/dashboard/web/guestbook/${guestbook.id}/remove">彻底删除</a>
                </li>
            </#if>
            </ul>
        </div>
    </td>
</tr>