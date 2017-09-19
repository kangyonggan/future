<#assign ctx="${(rca.contextPath)!''}">

<tr id="template-${template.id}">
    <td>
        <a href="${ctx}/downloads/templates/${template.name}" target="_blank">${template.name}</a>
    </td>
    <td>${template.type}</td>
    <td>${template.description}</td>
    <td><#include "delete.ftl"></td>
    <td><@c.relative_date datetime=template.createdTime/></td>
    <td><@c.relative_date datetime=template.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#tool/template/${template.id}/edit">编辑</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <#if template.isDeleted==1>
                    <li>
                        <a href="javascript:" data-role="template-remove" title="彻底删除"
                           data-url="${ctx}/dashboard/tool/template/${template.id}/remove">彻底删除</a>
                    </li>
                <#else>
                    <li>
                        <a href="#tool/template/${template.id}/generate">代码生成</a>
                    </li>
                </#if>
            </ul>
        </div>
    </td>
</tr>
