package com.kangyonggan.app.future.model.vo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

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
     * 章节代码
     */
    private Integer code;

    /**
     * 标题
     */
    private String title;

    /**
     * 书籍代码
     */
    @Column(name = "book_code")
    private Integer bookCode;

    /**
     * 上一章节代码
     */
    @Column(name = "prev_section_code")
    private Integer prevSectionCode;

    /**
     * 下一章节代码
     */
    @Column(name = "next_section_code")
    private Integer nextSectionCode;

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