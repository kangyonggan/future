package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "attachment")
public class Attachment implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 来源类型:{"news": "新闻", "article": "文章"}
     */
    @Column(name = "source_type")
    private String sourceType;

    /**
     * 来源ID
     */
    @Column(name = "source_id")
    private Long sourceId;

    /**
     * 附件类型
     */
    private String type;

    /**
     * 附件名称
     */
    private String name;

    /**
     * 路径
     */
    private String url;

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

    private static final long serialVersionUID = 1L;
}