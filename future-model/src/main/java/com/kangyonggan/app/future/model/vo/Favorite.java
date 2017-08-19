package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "favorite")
public class Favorite implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 用户名（手机号）
     */
    private String username;

    /**
     * 书籍代码
     */
    @Column(name = "book_code")
    private Integer bookCode;

    /**
     * 书名
     */
    @Column(name = "book_name")
    private String bookName;

    /**
     * 封面图片地址
     */
    @Column(name = "pic_url")
    private String picUrl;

    /**
     * 最后阅读的章节代码
     */
    @Column(name = "last_section_code")
    private Integer lastSectionCode;

    /**
     * 最后阅读的章节标题
     */
    @Column(name = "last_section_title")
    private String lastSectionTitle;

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