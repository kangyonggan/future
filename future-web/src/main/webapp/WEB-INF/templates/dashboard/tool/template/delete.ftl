<#if template.isDeleted == 1>
<a href="javascript:" data-role="template-tr" title="恢复模板"
   data-url="${ctx}/dashboard/tool/template/${template.id}/undelete">
    <span class="label label-danger arrowed-in">已删除</span>
</a>
<#else>
<a href="javascript:" data-role="template-tr" title="删除模板"
   data-url="${ctx}/dashboard/tool/template/${template.id}/delete">
    <span class="label label-success arrowed-in">未删除</span>
</a>
</#if>