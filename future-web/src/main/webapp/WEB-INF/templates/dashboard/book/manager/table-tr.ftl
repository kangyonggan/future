<#assign ctx="${(rca.contextPath)!''}">

<tr id="book-${book.code}">
    <td>${book.id}</td>
    <td>${book.code}</td>
    <td>${book.name}</td>
    <td>${book.author}</td>
    <td>${book.categoryName}</td>
    <td>
        <a href="${ctx}/${book.picUrl}" target="_blank">查看</a>
    </td>
    <td><#include "is-finished.ftl"></td>
    <td><#include "is-hot.ftl"></td>
    <td>${book.newSectionTitle!''}</td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#book/manager/${book.code}/sections">章节列表</a>

        <#if book.isFinished==0>
            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <li>
                    <a href="javascript:" data-role="book-update" title="更新章节"
                       data-url="${ctx}/dashboard/book/manager/${book.code}/update">
                        更新章节
                    </a>
                </li>
            </ul>
        </#if>
        </div>
    </td>
</tr>