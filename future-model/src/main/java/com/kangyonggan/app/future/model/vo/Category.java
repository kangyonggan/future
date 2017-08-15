package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "category")
public class Category implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 分类代码
     */
    private String code;

    /**
     * 分类名称
     */
    private String name;

    /**
     * 分类类型{"book": "小说", "blog": "博客"}
     */
    private String type;

    /**
     * 图片地址
     */
    @Column(name = "picUrl")
    private String picurl;

    /**
     * 书籍数量
     */
    @Column(name = "book_cnt")
    private Integer bookCnt;

    /**
     * 菜单排序(从0开始)
     */
    private Integer sort;

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