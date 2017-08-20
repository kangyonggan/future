<#assign ctx="${(rca.contextPath)!''}">

<tr id="book-${book.code}">
    <td>${book.username}</td>
    <td>${book.code}</td>
    <td>${book.name}</td>
    <td>${book.author}</td>
    <td>${book.categoryName}</td>
    <td>
        <a href="${ctx}/${book.picUrl}" target="_blank">查看</a>
    </td>
    <td><#include "is-finished.ftl"></td>
    <td><#include "is-hot.ftl"></td>
    <td><#include "is-auto_update.ftl"></td>
    <td><a href="#book/manager/${book.newSectionCode}/section">${book.newSectionTitle!''}</a></td>
    <td><a href="#book/manager/${book.lastSectionCode}/section">最后阅读章节</a></td>
</tr>