package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "section")
public class Section implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 上一章节ID
     */
    @Column(name = "prevSectionId")
    private Long prevsectionid;

    /**
     * 上一章节标题
     */
    @Column(name = "prevSectionTitle")
    private String prevsectiontitle;

    /**
     * 下一章节ID
     */
    @Column(name = "nextSectionId")
    private Long nextsectionid;

    /**
     * 下一章节标题
     */
    @Column(name = "nextSectionTitle")
    private String nextsectiontitle;

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
     * 内容
     */
    private String content;

    private static final long serialVersionUID = 1L;
}