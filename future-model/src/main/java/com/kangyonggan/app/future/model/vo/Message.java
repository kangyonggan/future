package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "message")
public class Message implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 消息标题
     */
    private String title;

    /**
     * 消息类型
     */
    private String type;

    /**
     * 创建人
     */
    @Column(name = "created_username")
    private String createdUsername;

    /**
     * 是否群发:{0:群发, 1:部分发送}
     */
    @Column(name = "is_group")
    private Byte isGroup;

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
     * 消息内容
     */
    private String content;

    @Transient
    private Byte isRead;

    private static final long serialVersionUID = 1L;
}