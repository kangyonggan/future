<#if book.isHot == 1>
<a href="javascript:" data-role="book-hot" title="取消推荐"
   data-url="${ctx}/dashboard/book/manager/${book.code}/unhot">
    <span class="label label-success arrowed-in">已推荐</span>
</a>
<#else>
<a href="javascript:" data-role="book-hot" title="推荐"
   data-url="${ctx}/dashboard/book/manager/${book.code}/hot">
    <span class="label label-default arrowed-in">未推荐</span>
</a>
</#if>