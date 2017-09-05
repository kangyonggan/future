<#if music.status == "waiting">
<span class="label label-purple arrowed-in">待审核</span>
<#elseif music.status == "reject">
<span class="label label-danger arrowed-in">审核未通过</span>
<#elseif music.status == "complete">
<span class="label label-success arrowed-in">审核通过</span>
<#else>
<span class="label label-warning arrowed-in">${music.status}</span>
</#if>