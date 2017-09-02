<#list types as e>
<#if e.type?upper_case==message.type?upper_case>
    ${e.getName()}[${e.getType()}]
</#if>
</#list>