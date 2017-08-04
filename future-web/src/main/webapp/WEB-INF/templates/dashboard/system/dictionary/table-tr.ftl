<#assign ctx="${(rca.contextPath)!''}">

<tr id="dictionary-${dictionary.code}">
    <td><#include "type.ftl"></td>
    <td>${dictionary.code}</td>
    <td>${dictionary.value}</td>
    <td>${dictionary.sort}</td>
    <td><#include "delete.ftl"></td>
    <td><@c.relative_date datetime=dictionary.createdTime/></td>
    <td>
        <div class="btn-group">
            <a data-toggle="modal" class="btn btn-xs btn-inverse"
               href="${ctx}/dashboard/system/dictionary/${dictionary.id}/edit"
               data-target="#myModal">编辑</a>


        <#if dictionary.isDeleted==1>
            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <li>
                    <a href="javascript:" data-role="dictionary-remove" title="物理删除字典"
                       data-url="${ctx}/dashboard/system/dictionary/${dictionary.id}/remove">
                        物理删除
                    </a>
                </li>
            </ul>
        </#if>
        </div>
    </td>
</tr>