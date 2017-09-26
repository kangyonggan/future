<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${mapperPackage}.${modelName}Mapper">
    <resultMap id="BaseResultMap" type="${modelPackage}.${modelName}">
        <#list columns as column>
            <#if column.field=='id'>
        <id column="id" property="id" jdbcType="BIGINT"/>
            <#else>
        <result column="${column.field}" property="<#include "fieldName.ftl"/>" jdbcType="<#include "jdbcType.ftl"/>"/>
            </#if>
        </#list>
    </resultMap>
</mapper>