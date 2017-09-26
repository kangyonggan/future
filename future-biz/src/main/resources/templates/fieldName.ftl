<#assign list=column.field?split("_")/>
<#list list as str><#if str_index==0>${str}<#else>${str?cap_first}</#if></#list>