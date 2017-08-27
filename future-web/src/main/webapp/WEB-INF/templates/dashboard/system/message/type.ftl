<#list types as e>
<#if e.type==message.type>
    ${e.getName()}[${e.getType()}]
</#if>
</#list>