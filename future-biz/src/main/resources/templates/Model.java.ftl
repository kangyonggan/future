package ${modelPackage};

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * ${table.tableComment}
 */
@Data
@Table(name = "${code.tableName}")
public class ${modelName} implements Serializable {
    <#list columns as column>

    /**
     * ${column.comment}
     */
    <#if column.field=='id'>
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    </#if>
    <#if column.field?contains("_")>
    @Column(name = "${column.field}")
    </#if>
    private <#include "type.ftl"/> <#include "fieldName.ftl"/>;
    </#list>

    private static final long serialVersionUID = 1L;
}