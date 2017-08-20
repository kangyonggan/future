<#if book.isAutoUpdate == 1>
<a href="javascript:" data-role="book-auto" title="取消自动更新"
   data-url="${ctx}/dashboard/book/manager/${book.code}/unAutoUpdate">
    <span class="label label-success arrowed-in">自动</span>
</a>
<#else>
<a href="javascript:" data-role="book-auto" title="自动更新"
   data-url="${ctx}/dashboard/book/manager/${book.code}/autoUpdate">
    <span class="label label-default arrowed-in">手动</span>
</a>
</#if>