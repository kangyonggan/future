<#list types as e>
<#if e.type==message.type>
    ${e.getName()}
</#if>
</#list>