<#if guestbook.status == "waiting">
<span class="label label-purple arrowed-in">待审核</span>
<#elseif guestbook.status == "reject">
<span class="label label-danger arrowed-in">审核未通过</span>
<#elseif guestbook.status == "complete">
<span class="label label-success arrowed-in">审核通过</span>
<#else>
<span class="label label-warning arrowed-in">${guestbook.status}</span>
</#if>