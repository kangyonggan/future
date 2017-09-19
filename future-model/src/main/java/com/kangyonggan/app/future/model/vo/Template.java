package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "template")
public class Template implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 分类
     */
    private String type;

    /**
     * 描述
     */
    private String description;

    /**
     * 所属用户
     */
    private String username;

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
     * 模板
     */
    private String template;

    /**
     * 上次使用的数据源(json格式)
     */
    @Column(name = "data_source")
    private String dataSource;

    private static final long serialVersionUID = 1L;
}