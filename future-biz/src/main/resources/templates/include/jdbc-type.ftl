<#if column.type?starts_with("bigint")>BIGINT<#elseif column.type?starts_with("integer")>INTEGER<#elseif column.type?starts_with("tinyint")>TINYINT<#elseif column.type?starts_with("timestamp")>TIMESTAMP<#else>VARCHAR</#if>