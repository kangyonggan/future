<#assign ctx="${(rca.contextPath)!''}">

<tr id="code-${code.id}">
    <td>${code.id}</td>
    <td>${code.tableName}</td>
    <td>${code.menuName}</td>
    <td>${code.createdUsername}</td>
    <td><@c.relative_date datetime=code.createdTime/></td>
    <td><@c.relative_date datetime=code.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#tool/code/${code.id}">生成</a>
        </div>
    </td>
</tr>
