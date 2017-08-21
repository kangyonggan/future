<#assign ctx="${(rca.contextPath)!''}">

<tr id="article-${article.id}">
    <td>${article.id}</td>
    <td>${article.username}</td>
    <td>${article.title}</td>
    <td>${article.categoryName}</td>
    <td><#include "status.ftl"></td>
    <td><#include "delete.ftl"></td>
    <td><@c.relative_date datetime=article.createdTime/></td>
    <td><@c.relative_date datetime=article.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#user/review/${article.id}">查看</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <li>
                    <a href="#user/review/${article.id}/edit">编辑</a>
                </li>
            <#if article.status=="waiting">
            <#--待审核-->
                <li>
                    <a href="javascript:" data-role="article-tr" title="审核通过"
                       data-url="${ctx}/dashboard/user/review/${article.id}/complete">审核通过</a>
                </li>
                <li>
                    <a href="javascript:" data-role="article-tr" title="审核不通过"
                       data-url="${ctx}/dashboard/user/review/${article.id}/reject">审核不通过</a>
                </li>
            <#elseif article.status=="reject" || article.status=="complete">
            <#--审核不通过 和 审核通过-->
                <li>
                    <a href="javascript:" data-role="article-tr" title="撤销审核"
                       data-url="${ctx}/dashboard/user/review/${article.id}/waiting">撤销审核</a>
                </li>
            </#if>

            <#if article.isDeleted==1>
                <li>
                    <a href="javascript:" data-role="article-remove" title="彻底删除"
                       data-url="${ctx}/dashboard/user/review/${article.id}/remove">彻底删除</a>
                </li>
            </#if>
            </ul>
        </div>
    </td>
</tr>