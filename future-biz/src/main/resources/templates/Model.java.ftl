package ${modelPackage};

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    </#list>

    private static final long serialVersionUID = 1L;
}