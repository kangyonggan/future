${'<'}#assign ctx="${'$'}{(rca.contextPath)!''}"${'>'}

<tr id="${code.tableName}-${'$'}{${modelName?uncap_first}.id}">
    <td>${'$'}{${modelName?uncap_first}.code}</td>
    <td>${'$'}{${modelName?uncap_first}.name}</td>
    <td>${'<'}#include "delete.ftl"/${'>'}</td>
    <td>${'<'}@c.relative_date datetime=role.createdTime/></td>
    <td>
        <div class="btn-group">
            <a data-toggle="modal" class="btn btn-xs btn-inverse" href="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id}"
               data-target="#myModal">详情</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <li>
                <#if step1.addBtnType=='1'>
                    <a href="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id}/edit" data-toggle="modal" data-target="#myModal"
                       data-backdrop="static">编辑</a>
                <#else>
                    <a href="#${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id}/edit">编辑</a>
                </#if>
                </li>
            ${'<'}#if ${modelName?uncap_first}.isDeleted==1${'>'}
                <li>
                    <a href="javascript:" data-role="${code.tableName}-remove" title="物理删除<#include "include/table-comment.ftl"/>"
                       data-url="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id}/remove">
                        物理删除
                    </a>
                </li>
            ${'<'}/#if${'>'}
            </ul>
        </div>
    </td>
</tr>