package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "book")
public class Book implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 书名
     */
    private String name;

    /**
     * 作者
     */
    private String author;

    /**
     * 分类代码
     */
    @Column(name = "category_code")
    private String categoryCode;

    /**
     * 分类名称
     */
    @Column(name = "category_name")
    private String categoryName;

    /**
     * 封面图片地址
     */
    @Column(name = "pic_url")
    private String picUrl;

    /**
     * 书籍代码
     */
    private Integer code;

    /**
     * 描述
     */
    private String descp;

    /**
     * 是否完结{1: 完结, 0: 连载}
     */
    @Column(name = "is_finished")
    private Byte isFinished;

    /**
     * 推荐{1: 是, 0: 否}
     */
    @Column(name = "is_hot")
    private Byte isHot;

    /**
     * 最新章节代码
     */
    @Column(name = "new_section_code")
    private Integer newSectionCode;

    /**
     * 最新章节标题
     */
    @Column(name = "new_section_title")
    private String newSectionTitle;

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