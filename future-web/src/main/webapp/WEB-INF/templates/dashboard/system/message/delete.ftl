<#if message.isDeleted == 1>
<a href="javascript:" data-role="message-delete" title="恢复消息"
   data-url="${ctx}/dashboard/system/message/${message.id}/undelete">
    <span class="label label-danger arrowed-in">已删除</span>
</a>
<#else>
<a href="javascript:" data-role="message-delete" title="删除消息"
   data-url="${ctx}/dashboard/system/message/${message.id}/delete">
    <span class="label label-success arrowed-in">未删除</span>
</a>
</#if>