<#assign ctx="${(rca.contextPath)!''}">

<tr id="table-${table.tableName}">
    <td>${table.tableName}</td>
    <td>${table.tableComment}</td>
    <td>${table.tableRows}</td>
    <td><@c.relative_date datetime=table.createdTime/></td>
    <td><@c.relative_date datetime=table.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#tool/code/${table.tableName}/generate">生成代码</a>
        </div>
    </td>
</tr>
