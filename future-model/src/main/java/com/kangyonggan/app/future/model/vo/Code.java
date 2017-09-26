package com.kangyonggan.app.future.model.vo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 代码生成表
 */
@Data
@Table(name = "code")
public class Code implements Serializable {

    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 表名称
     */
    @Column(name = "table_name")
    private String tableName;

    /**
     * 菜单名称
     */
    @Column(name = "menu_name")
    private String menuName;

    /**
     * 第一步
     */
    private String step1;

    /**
     * 第二步
     */
    private String step2;

    /**
     * 第仨步
     */
    private String step3;

    /**
     * 创建人
     */
    @Column(name = "created_username")
    private String createdUsername;

    /**
     * 逻辑删除:{0:未删除, 1:已删除}
     */
    @Column(name = "is_deleted")
    private Byte isDeleted;

    /**
     * 创建时间
     */
    @Column(name = "created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @Column(name = "updated_time")
    private Date updatedTime;

    /**
     * 状态
     */
    private String status;

    private static final long serialVersionUID = 1L;
}